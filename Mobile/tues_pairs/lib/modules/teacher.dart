import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tues_pairs/modules/user.dart';
import 'package:tues_pairs/modules/tag.dart';

class Teacher extends User {

  Teacher(String uid, String email, String photoURL, bool isAdmin, String username) :
        super(uid: uid, email: email, photoURL: photoURL, isAdmin: isAdmin, username: username);

}