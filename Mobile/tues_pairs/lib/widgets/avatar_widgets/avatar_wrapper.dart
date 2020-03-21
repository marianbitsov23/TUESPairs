import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:tues_pairs/services/image.dart';
import 'package:tues_pairs/modules/user.dart';
import 'package:tues_pairs/widgets/avatar_widgets/avatar.dart';

class AvatarWrapper extends StatefulWidget {

  @override
  _AvatarWrapperState createState() => _AvatarWrapperState();
}

class _AvatarWrapperState extends State<AvatarWrapper> {

  NetworkImage userImage;

  @override
  Widget build(BuildContext context) {
    final imageService = Provider.of<ImageService>(context) ?? null;
    final currentUser = Provider.of<User>(context) ?? null;

    if(currentUser == null) { // if no currentUser is detected, go with just the layout
      return Avatar(imageService: imageService, userImage: null);
    }

    return FutureBuilder( // else, get his image (avoid ternaries if possible)
      future: imageService.getImageByURL(currentUser.photoURL).then((value) {
        userImage = value;
      }),
      builder: (context, snapshot) {
        if(snapshot.hasError) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              'Oops, an error occurred!',
              style: TextStyle(color: Colors.black),
            ),
          );
        }
        else if(snapshot.connectionState == ConnectionState.done) {
          return Avatar(imageService: imageService, userImage: userImage);
        } else {
          return Container(); // TODO: shapshot.hasError
        }
      }
    );
  }
}
