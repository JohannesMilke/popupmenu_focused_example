import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:popupmenu_focused_example/utils.dart';

class MultipleMenuWidget extends StatelessWidget {
  final urlImages = [
    'https://images.unsplash.com/flagged/photo-1577351285836-19ff13f8e615?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80',
    'https://images.unsplash.com/photo-1577975882846-431adc8c2009?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=800&q=80',
    'https://images.unsplash.com/photo-1579503841516-e0bd7fca5faa?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80',
    'https://images.unsplash.com/photo-1595152772835-219674b2a8a6?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80',
    'https://images.unsplash.com/photo-1569779213435-ba3167dde7cc?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80',
    'https://images.unsplash.com/photo-1566139884330-4786a15dff47?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=756&q=80',
    'https://images.unsplash.com/photo-1603057002111-101b8353e14b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=836&q=80',
    'https://images.unsplash.com/photo-1552774021-9ebbb764f03e?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80',
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: GridView.count(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(12),
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: urlImages
                .map((urlImage) => buildCard(context, urlImage))
                .toList(),
          ),
        ),
      );

  Widget buildCard(BuildContext context, String urlImage) => FocusedMenuHolder(
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
        blurSize: 8,
        blurBackgroundColor: Colors.white,
        menuWidth: MediaQuery.of(context).size.width * 0.5,
        menuItemExtent: 50,
        duration: Duration(seconds: 0),
        animateMenuItems: false,
        menuOffset: 12,
        openWithTap: true,
        onPressed: () {},
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(19),
            child: Image.network(urlImage, fit: BoxFit.cover),
          ),
        ),
      );
}
