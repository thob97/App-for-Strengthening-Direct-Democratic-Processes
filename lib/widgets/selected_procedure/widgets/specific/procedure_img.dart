import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/pages/new_procedure.dart';

class ProcedureImg extends StatelessWidget {
  const ProcedureImg({
    required this.heroID,
    required this.imgAsset, //TODO img file
    required this.isFollowed,
    this.showEdit = false,
  });

  final int heroID;
  final String imgAsset;
  final bool isFollowed;
  final bool showEdit;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: heroID,
      child: Stack(
        children: [
          _loadImage(),
          _TopIcons(isFollowed: isFollowed, showEdit: showEdit),
        ],
      ),
    );
  }

  Widget _loadImage() {
    return Image.asset(
      imgAsset,
      fit: BoxFit.cover,
    );
  }
}

class _TopIcons extends StatefulWidget {
  const _TopIcons({required this.isFollowed, required this.showEdit});

  final bool isFollowed;
  final bool showEdit;

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
    return Row(
      children: [
        _cancelButton(),
        const Spacer(),
        if (widget.showEdit == false)
          _favoriteIcon()
        else
          const _TransitionSettingsButton(openChild: NewProcedurePage()),
        _shareButton(),
      ],
    );
  }

  Widget _shareButton() {
    return Material(
      //material for ripple effect over img
      color: Colors.transparent,
      child: IconButton(
        splashRadius: 24, //standard icon size
        color: Colors.black54,
        onPressed: _onPressedShare,
        icon: const Icon(Icons.share),
      ),
    );
  }

  Widget _cancelButton() {
    //material for ripple effect over img
    return Material(
      color: Colors.transparent,
      child: IconButton(
        splashRadius: 24, //standard icon size
        color: Colors.black54,
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
        splashRadius: 24, //standard icon size
        color: Colors.pinkAccent,
        onPressed: _onPressedFavorite,
        icon: isFollowed == false
            ? const Icon(Icons.favorite_border)
            : const Icon(Icons.favorite),
      ),
    );
  }

  void _onPressedFavorite() {
    //TODO upload to data base
    setState(() => isFollowed = !isFollowed);
  }

  void _onPressedShare() {
    //TODO
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
      onPressed: openContainer,
      icon: const Icon(
        Icons.settings,
        color: Colors.black54,
      ),
    );
  }
}
