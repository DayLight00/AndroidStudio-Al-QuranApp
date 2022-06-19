import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;
  final bool hasBorder;

  const ProfileWidget({
    Key key,
    @required this.imagePath,
    @required this.onClicked,
    this.hasBorder = false,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;
    final image = NetworkImage(imagePath);

    return Stack(
      children: [
      CircleAvatar(
      radius: 25.0,

      child: CircleAvatar(
          radius: hasBorder ? 20.0 : 25.0,
          backgroundColor: Colors.grey[200],
          backgroundImage: CachedNetworkImageProvider(imagePath),


          ),
      ),
        ],










    );
  }




}
