import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:popupmenu_focused_example/utils.dart';

class SingleMenuWidget extends StatelessWidget {
  static const double padding = 40;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              BlurHash(hash: 'L35;~?IVD\$s;.AoIM_fk9Zt7t7WB'),
              buildCover(context),
            ],
          ),
        ),
      );

  Widget buildCover(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildAppBar(),
          buildSong(context),
        ],
      );

  Widget buildSong(BuildContext context) => Container(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            buildImage(context),
            const SizedBox(height: 32),
            Text(
              'Swimming In the Ocean',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent diam magna, ultricies.',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );

  Widget buildImage(BuildContext context) => FocusedMenuHolder(
        menuWidth: MediaQuery.of(context).size.width - padding * 2,
        menuItems: [
          FocusedMenuItem(
            title: Text('Favourite'),
            trailingIcon: Icon(Icons.favorite_border),
            onPressed: () => Utils.showSnackbar(context, 'Selected: Favourite'),
          ),
          FocusedMenuItem(
            title: Text('Bookmark'),
            trailingIcon: Icon(Icons.bookmark_border),
            onPressed: () => Utils.showSnackbar(context, 'Selected: Bookmark'),
          ),
          FocusedMenuItem(
            title: Text('Share'),
            trailingIcon: Icon(Icons.share),
            onPressed: () => Utils.showSnackbar(context, 'Selected: Share'),
          ),
          FocusedMenuItem(
            title: Text('Delete', style: TextStyle(color: Colors.white)),
            trailingIcon: Icon(Icons.delete_forever, color: Colors.white),
            backgroundColor: Colors.red,
            onPressed: () => Utils.showSnackbar(context, 'Selected: Delete'),
          ),
        ],
        blurBackgroundColor: Colors.blueGrey[900],
        menuOffset: 20,
        openWithTap: true,
        duration: Duration(seconds: 0),
        animateMenuItems: false,
        onPressed: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: AspectRatio(
            aspectRatio: 1 / 1,
            child: Image.network(
              'https://images.unsplash.com/photo-1599488615731-7e5c2823ff28?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250,
            ),
          ),
        ),
      );

  Widget buildAppBar() => Container(
        height: 56,
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.expand_more, color: Colors.white),
            ),
            Expanded(
              child: Text(
                'My Playlist',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert, color: Colors.white),
            ),
          ],
        ),
      );
}
