import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:swp_direktdem_verf_app/config/custom_theme_data.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMediaView extends StatelessWidget {
  const SocialMediaView({required this.socialMediaList});

  final List<SocialMedia> socialMediaList;

  ///Style
  static const double _distBetweenItems = 10;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding:
          const EdgeInsets.symmetric(horizontal: MyConstants.horPagePadding),
      itemCount: socialMediaList.length,
      itemBuilder: (context, index) {
        return _SocialMediaButton(
          type: socialMediaList[index].type,
          url: socialMediaList[index].url,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: _distBetweenItems);
      },
    );
  }
}

enum SocialMediaType {
  website,
  twitter,
  instagram,
  facebook,
}

class SocialMedia {
  SocialMedia({
    required this.type,
    required this.url,
  });

  final SocialMediaType type;
  final String url;
}

class _SocialMediaButton extends StatelessWidget {
  const _SocialMediaButton({required this.type, required this.url});

  final SocialMediaType type;
  final String url;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(MyConstants.borderRadius),
      child: Material(
        color: _getColor(),
        child: ListTile(
          title: Text(
            _getTitle(),
            style: Theme.of(context)
                .textTheme
                .bodyText2
                ?.copyWith(color: Colors.white),
          ),
          leading: Icon(_getIcon(), color: Colors.white),
          onTap: _launchURL,
        ),
      ),
    );
  }

  Future<void> _launchURL() async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

  String _getTitle() {
    switch (type) {
      case SocialMediaType.website:
        return 'Webseite';
      case SocialMediaType.facebook:
        return 'Facebook';
      case SocialMediaType.instagram:
        return 'Instagram';
      case SocialMediaType.twitter:
        return 'Twitter';
    }
  }

  IconData _getIcon() {
    switch (type) {
      case SocialMediaType.website:
        return Icons.public;
      case SocialMediaType.facebook:
        return Icons.facebook;
      case SocialMediaType.instagram:
        return CommunityMaterialIcons.instagram;
      case SocialMediaType.twitter:
        return CommunityMaterialIcons.twitter;
    }
  }

  Color _getColor() {
    switch (type) {
      case SocialMediaType.website:
        return Colors.blue;
      case SocialMediaType.facebook:
        return const Color(0xff3b5998);
      case SocialMediaType.instagram:
        return const Color(0xff8a3ab9);
      case SocialMediaType.twitter:
        return const Color(0xff00acee);
    }
  }
}
