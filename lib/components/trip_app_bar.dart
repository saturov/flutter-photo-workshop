import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:sharing_codelab/model/photos_library_api_model.dart';
import 'package:sharing_codelab/pages/login_page.dart';

class TripAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<PhotosLibraryApiModel>(
      builder:
          (BuildContext context, Widget child, PhotosLibraryApiModel apiModel) {
        return AppBar(
          title: Row(
            children: <Widget>[
              Container(
                child: SvgPicture.asset(
                  'assets/ic_fieldTrippa.svg',
                  excludeFromSemantics: true,
                  color: Colors.green[800],
                ),
                padding: const EdgeInsets.only(right: 8),
              ),
              Text(
                'KGD Photo App',
                style: TextStyle(color: Colors.green[800]),
              ),
            ],
          ),
          actions: _buildActions(apiModel, context),
        );
      },
    );
  }

  List<Widget> _buildActions(
      PhotosLibraryApiModel apiModel, BuildContext context) {
    final List<Widget> widgets = <Widget>[];

    if (apiModel.isLoggedIn()) {
      if (apiModel.user.photoUrl != null) {
        widgets.add(Container(
          child: CircleAvatar(
            radius: 14,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.network(
                apiModel.user.photoUrl,
              ),
            ),
          ),
        ));
      } else {
        // Placeholder to use when there is no photo URL.
        final List<String> placeholderCharSources = <String>[
          apiModel.user.displayName,
          apiModel.user.email,
          '-',
        ];
        final String placeholderChar = placeholderCharSources
            .firstWhere(
                (String str) => str != null && str.trimLeft().isNotEmpty)
            .trimLeft()[0]
            .toUpperCase();

        widgets.add(
          Container(
            height: 6,
            child: CircleAvatar(
              child: Text(placeholderChar),
            ),
          ),
        );
      }

      widgets.add(
        PopupMenuButton<_AppBarOverflowOptions>(
          onSelected: (_AppBarOverflowOptions selection) async {
            await apiModel.signOut();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => LoginPage(),
              ),
            );
          },
          itemBuilder: (BuildContext context) {
            return <PopupMenuEntry<_AppBarOverflowOptions>>[
              PopupMenuItem<_AppBarOverflowOptions>(
                value: _AppBarOverflowOptions.signout,
                child: const Text('Disconnect from Google Photos'),
              )
            ];
          },
        ),
      );
    }

    return widgets;
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}

enum _AppBarOverflowOptions {
  signout,
}
