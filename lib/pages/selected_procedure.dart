import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swp_direktdem_verf_app/methods/formate_date_to_de_layout.dart';
import 'package:swp_direktdem_verf_app/pages/map_page.dart';
import 'package:swp_direktdem_verf_app/service/database_substitute.dart';
import 'package:swp_direktdem_verf_app/service/model/procedure/detailed_procedure.dart';
import 'package:swp_direktdem_verf_app/service/service_database.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_future_builder.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/elementary/my_expansion_panel_list.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/specific/data_list_view.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/specific/phase_view.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/specific/procedure_img.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/specific/process_description.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/specific/social_media_view.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/specific/vote_results_view.dart';

//widgets which import this class, may only use it for forwarding it to this widget!
//used so for a smooth hero animation. Else these variables would obtained via db service
//and thus this widget would need to wait for future
class TransitionItems {
  TransitionItems({
    required this.showEdit,
    required this.showSubscribe,
    required this.isSubscribed,
    required this.description,
    required this.process,
    required this.creatorFirstName,
    required this.creatorLastName,
    required this.createDate,
    required this.endDate,
    required this.organisationName,
  });

  final bool showEdit;
  final bool showSubscribe;
  final bool isSubscribed;
  final String description;
  final String process;
  final String creatorFirstName;
  final String creatorLastName;
  final DateTime? createDate;
  final DateTime? endDate;
  final String? organisationName;
}

class SelectedProcedure extends StatefulWidget {
  const SelectedProcedure({
    required this.id,
    required this.img,
    required this.showEdit,
    required this.showSubscribe,
    required this.isSubscribed,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.process,
    required this.creatorFirstName,
    required this.creatorLastName,
    required this.createDate,
    required this.endDate,
    required this.organisationName,
  });

  final String id;
  final File img;
  final bool showEdit;
  final bool showSubscribe;
  final bool isSubscribed;
  final String title;
  final String subtitle;
  final String description;
  final String process;
  final String creatorFirstName;
  final String creatorLastName;
  final DateTime? createDate;
  final DateTime? endDate;
  final String? organisationName;

  @override
  State<SelectedProcedure> createState() => _SelectedProcedureState();
}

class _SelectedProcedureState extends State<SelectedProcedure> {
  late Future<DetailedProcedure?> _procedures;

  @override
  void initState() {
    super.initState();
    _procedures = _getDataBaseData();
  }

  Future<DetailedProcedure?> _getDataBaseData() async {
    return Provider.of<ServiceDataBase>(context, listen: false)
        .getProcedureByID(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _getProcedureImg(),
          _getProcessDescription(),
          _futureBody(),
        ],
      ),
    );
  }

  ///ProcedureImg
  ProcedureImg _getProcedureImg() {
    return ProcedureImg(
      showSubscribe: widget.showSubscribe,
      showEdit: widget.showEdit,
      heroID: widget.id,
      img: widget.img,
      isFollowed: widget.isSubscribed,
    );
  }

  ///ProcedureDescription
  ProcessDescription _getProcessDescription() {
    return ProcessDescription(
      titleContent: widget.title,
      descriptionContent: '${widget.description}\n${widget.process}',
      categoryContent: getCategories(),
    );
  }

  List<List<String>> getCategories() {
    final List<String> categories = [];
    final List<String> values = [];
    if (widget.creatorFirstName != '' || widget.creatorLastName != '') {
      categories.add('Von');
      //either lastN firstN or lastName or firstName
      values.add(
        widget.creatorFirstName != '' && widget.creatorLastName != ''
            ? '${widget.creatorFirstName} ${widget.creatorLastName}'
            : widget.creatorFirstName != ''
                ? widget.creatorFirstName
                : widget.creatorLastName,
      );
    }
    if (widget.createDate != null) {
      categories.add('erstellt am');
      values.add(formatDateToDELayout(widget.createDate)!);
    }
    if (widget.endDate != null) {
      categories.add('beendet am');
      values.add(formatDateToDELayout(widget.endDate)!);
    }
    if (widget.organisationName != null) {
      categories.add('organisation');
      values.add(widget.organisationName!);
    }
    return [categories, values];
  }

  ///ExpansionPanel
  Widget _futureBody() {
    return CustomFutureBuilder(
      futureData: _procedures,
      builder: (result) {
        result as DetailedProcedure;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _getExpansionPanelList(result),
            _getMapTile(),
          ],
        );
      },
    );
  }

  MyExpansionPanelList _getExpansionPanelList(DetailedProcedure procedure) {
    List<Phase> _getPhasesFromDbData(DetailedProcedure procedure) {
      return [
        Phase(
          title: DatabaseSubstitute.phaseTitle(1),
          started: procedure.berlin1?.begin,
          ended: procedure.berlin1?.end,
          subtitle: DatabaseSubstitute.phaseInformation(1),
          progress: procedure.berlin1?.progress ?? 0,
          completed: procedure.berlin1?.completed ?? false,
        ),
        Phase(
          title: DatabaseSubstitute.phaseTitle(2),
          started: procedure.berlin2?.begin,
          ended: procedure.berlin2?.end,
          subtitle: DatabaseSubstitute.phaseInformation(2),
          progress: procedure.berlin2?.progress ?? 0,
          completed: procedure.berlin2?.completed ?? false,
        ),
        Phase(
          title: DatabaseSubstitute.phaseTitle(3),
          started: procedure.berlin3?.begin,
          ended: procedure.berlin3?.end,
          subtitle: DatabaseSubstitute.phaseInformation(3),
          progress: procedure.berlin3?.progress ?? 0,
          completed: procedure.berlin3?.completed ?? false,
        ),
      ];
    }

    List<Data> _getDocumentsFromDbData(DetailedProcedure procedure) {
      return DatabaseSubstitute.getDocuments(procedureId: widget.id);
    }

    List<SocialMedia> _getSocialMediaFromDbData(DetailedProcedure procedure) {
      return [
        SocialMedia(
          type: SocialMediaType.facebook,
          url: procedure.facebook == '' ? null : procedure.facebook,
        ),
        SocialMedia(
          type: SocialMediaType.instagram,
          url: procedure.instagram == '' ? null : procedure.instagram,
        ),
        SocialMedia(
          type: SocialMediaType.whatsapp,
          url: procedure.whatsapp == '' ? null : procedure.whatsapp,
        ),
        SocialMedia(
          type: SocialMediaType.twitter,
          url: procedure.twitter == '' ? null : procedure.twitter,
        ),
        SocialMedia(
          type: SocialMediaType.website,
          url: procedure.website == '' ? null : procedure.website,
        ),
      ];
    }

    List<Topic> _getTopics(DetailedProcedure procedure) {
      return [
        Topic(
          header: 'Phase',
          expandedWidget: PhaseView(phases: _getPhasesFromDbData(procedure)),
        ),
        Topic(
          header: 'Dokumente',
          expandedWidget: DataListView(
            dataList: _getDocumentsFromDbData(procedure),
          ),
        ),
        Topic(
          header: 'Ergebnisse',
          expandedWidget: VoteResultsView(
            outcomeReason: procedure.outcomeReason,
            signaturesCollectedPhase1: procedure.berlin1?.signaturesCollected,
            signaturesCollectedPhase2: procedure.berlin2?.signaturesCollected,
            signaturesCountedPhase1: procedure.berlin1?.signaturesCounted,
            signaturesCountedPhase2: procedure.berlin2?.signaturesCounted,
            signaturesValidPhase1: procedure.berlin1?.signaturesValid,
            signaturesValidPhase2: procedure.berlin2?.signaturesValid,
            votesCountedPhase3: procedure.berlin3?.votesCounted,
            votesValidPhase3: procedure.berlin3?.votesValid,
            votesYesPhase3: procedure.berlin3?.votesYes,
          ),
        ),
        Topic(
          header: 'Social Media',
          expandedWidget: SocialMediaView(
            socialMediaList: _getSocialMediaFromDbData(procedure),
          ),
        ),
      ];
    }

    return MyExpansionPanelList(topics: _getTopics(procedure));
  }

  ///Map
  MapTile _getMapTile() {
    return const MapTile();
  }
}
