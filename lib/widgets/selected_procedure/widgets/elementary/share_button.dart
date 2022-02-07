import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({required this.onShare, required this.iconColor});

  final VoidCallback onShare;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      //material for ripple effect over img
      color: Colors.transparent,
      child: IconButton(
        splashRadius: Theme.of(context).iconTheme.size, //standard icon size
        color: iconColor,
        onPressed: onShare,
        icon: const Icon(Icons.share),
      ),
    );
  }
}
