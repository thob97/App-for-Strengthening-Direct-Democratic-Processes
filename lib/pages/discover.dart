import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/widgets/animated_bottom_navigation_bar.dart';
import 'package:swp_direktdem_verf_app/widgets/card_procedure.dart';
import 'package:swp_direktdem_verf_app/widgets/card_statistic.dart';
import 'package:swp_direktdem_verf_app/widgets/custom_appbar.dart';

class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  String? _sortBy;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar('Discover'),
      bottomNavigationBar: const AnimatedNavBar(selectedIndex: 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 80,
          ),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _search(),
              _allProcedures(),
              _allStatistics(),
            ],
          ),
        ),
      ),
    );
  }

  void _onSearchSubmit(String? text) {
    debugPrint(text);
  }

  Widget _search() {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final TextEditingController controller = TextEditingController();
    return Form(
      key: _formKey,
      child: Stack(
        children: [
          SizedBox(
            width: 350,
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                icon: IconButton(
                  constraints: const BoxConstraints(),
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  splashRadius: 24,
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    _onSearchSubmit(controller.value.text);
                  },
                ),
                hintText: 'Suche...',
                suffix: IconButton(
                  constraints: const BoxConstraints(),
                  iconSize: 20,
                  padding: EdgeInsets.zero,
                  splashRadius: 24,
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    controller.clear();
                  },
                ),
              ),
              onFieldSubmitted: (String? value) {
                _onSearchSubmit(controller.value.text);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _section(
    String title,
    Widget child, [
    Icon? icon,
    void Function()? onPressed,
  ]) {
    IconButton? titleBtn;
    if (icon != null) {
      titleBtn = IconButton(
        onPressed: onPressed,
        icon: icon,
        color: Theme.of(context).colorScheme.primary,
      );
    }
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .headline2
                      ?.apply(color: Theme.of(context).colorScheme.primary),
                ),
              ),
              if (titleBtn != null) titleBtn,
            ],
          ),
          child,
        ],
      ),
    );
  }

  Widget _allProcedures() {
    // print('All Procedures: $_sortBy');
    String title = 'Alle Verfahren';
    if (_sortBy != null) title = 'Alle Verfahren ($_sortBy)';
    return _section(
      title,
      SizedBox(
        height: 250,
        child: PageView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return CardProcedure(
              title: 'Verfahren No. $index',
              description:
                  ' Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
              followers: 3,
              followed: false,
              year: 2022,
              month: 01,
              day: 20,
              progress: 11.0,
            );
          },
          itemCount: 15,
        ),
      ),
      const Icon(Icons.sort),
      () async {
        final filter = await showDialog<String?>(
          context: context,
          builder: (context) {
            return SimpleDialog(
              title: const Text('Alle Verfahren filtern'),
              children: [
                SimpleDialogOption(
                  onPressed: () => Navigator.pop(context, 'none'),
                  child: const Text('keine'),
                ),
                SimpleDialogOption(
                  onPressed: () => Navigator.pop(context, 'tag0'),
                  child: const Text('In Phase 1'),
                ),
                SimpleDialogOption(
                  onPressed: () => Navigator.pop(context, 'tag1'),
                  child: const Text('In Phase 2'),
                ),
                SimpleDialogOption(
                  onPressed: () => Navigator.pop(context, 'tag2'),
                  child: const Text('In Phase 3'),
                ),
              ],
            );
          },
        );
        setState(() {
          if (filter == 'none') {
            _sortBy = null;
          } else if (filter != null) {
            _sortBy = filter;
          }
        });
      },
    );
  }

  Widget _allStatistics() {
    return _section(
      'Schon gewusst?',
      SizedBox(
        height: 250,
        child: PageView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return CardStatistic(
              title: 'Statistik No. $index',
              description:
                  ' Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.',
              followed: false,
            );
          },
          itemCount: 15,
        ),
      ),
    );
  }
}
