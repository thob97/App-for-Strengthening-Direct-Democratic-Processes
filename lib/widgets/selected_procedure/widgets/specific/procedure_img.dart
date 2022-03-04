import 'dart:io';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:swp_direktdem_verf_app/pages/create_new_procedure/new_procedure1.dart';
import 'package:swp_direktdem_verf_app/widgets/selected_procedure/widgets/elementary/share_button.dart';

class ProcedureImg extends StatelessWidget {
  const ProcedureImg({
    required this.heroID,
    required this.img,
    required this.showSubscribe,
    required this.isFollowed,
    required this.showEdit,
  });

  final String heroID;
  final File img;
  final bool showSubscribe;
  final bool isFollowed;
  final bool showEdit;

  ///Style
  static const double _maxImgHeight = 400;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroID,
      child: Stack(
        children: [
          _loadImage(),
          _TopIcons(
            showSubscribe: showSubscribe,
            isFollowed: isFollowed,
            showEdit: showEdit,
            onFollow: _onFollow,
            onShare: _onShare,
          ),
        ],
      ),
    );
  }

  Widget _loadImage() {
    return Image.file(
      img,
      height: _maxImgHeight,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }

  ///TODO database
  Future<void> _onShare() async {
    const urlPreview = 'www.google.com';
    await Share.share('This is an example \n$urlPreview');
  }

  ///TODO database
  void _onFollow() {}
}

class _TopIcons extends StatefulWidget {
  const _TopIcons({
    required this.showSubscribe,
    required this.isFollowed,
    required this.showEdit,
    required this.onShare,
    required this.onFollow,
  });

  final bool showSubscribe;
  final bool isFollowed;
  final bool showEdit;
  final VoidCallback onShare;
  final VoidCallback onFollow;

  ///style
  static const Color _iconColor = Colors.black54;

  @override
  _TopIconsState createState() => _TopIconsState();
}

class _TopIconsState extends State<_TopIcons> {
  bool isFollowed = false;

  @override
  void initState() {
    isFollowed = widget.isFollowed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          children: [
            _cancelButton(),
            const Spacer(),
            if (widget.showSubscribe) _favoriteIcon(),
            _shareButton(),
          ],
        ),
        if (widget.showEdit)
          const _TransitionSettingsButton(openChild: NewProcedure1()),
      ],
    );
  }

  Widget _shareButton() {
    return ShareButton(
      onShare: widget.onShare,
      iconColor: _TopIcons._iconColor,
    );
  }

  Widget _cancelButton() {
    //material for ripple effect over img
    return Material(
      color: Colors.transparent,
      child: IconButton(
        splashRadius: Theme.of(context).iconTheme.size, //standard icon size
        color: _TopIcons._iconColor,
        onPressed: () => Navigator.of(context).pop(),
        icon: const Icon(Icons.clear_rounded),
      ),
    );
  }

  Widget _favoriteIcon() {
    //material for ripple effect over img
    return Material(
      color: Colors.transparent,
      child: IconButton(
        splashRadius: Theme.of(context).iconTheme.size, //standard icon size
        color: Colors.pinkAccent,
        onPressed: _onPressedFavorite,
        icon: isFollowed == false
            ? const Icon(Icons.favorite_border)
            : const Icon(Icons.favorite),
      ),
    );
  }

  void _onPressedFavorite() {
    widget.onFollow();
    setState(() => isFollowed = !isFollowed);
  }
}

class _TransitionSettingsButton extends StatelessWidget {
  const _TransitionSettingsButton({required this.openChild});

  final Widget openChild;

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      transitionType: ContainerTransitionType.fade,
      openBuilder: (BuildContext context, VoidCallback _) => openChild,
      closedElevation: 0.0,
      //floatingActionButton elevation
      openElevation: 0,
      closedShape: _roundShape(context),
      closedColor: Colors.transparent,
      closedBuilder: (BuildContext context, VoidCallback openContainer) =>
          _settingIcon(context, openContainer),
    );
  }

  RoundedRectangleBorder _roundShape(BuildContext context) {
    return const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(26 / 2),
      ),
    );
  }

  Widget _settingIcon(BuildContext context, VoidCallback openContainer) {
    return IconButton(
      splashRadius: Theme.of(context).iconTheme.size,
      onPressed: openContainer,
      icon: const Icon(
        Icons.settings,
        color: _TopIcons._iconColor,
      ),
    );
  }
}
