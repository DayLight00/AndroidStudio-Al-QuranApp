import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Post {
  final String topic;
  final String description;
  final String course;
  final String uid;
  final String username;
  final String postId;
  final  date;
  final String posturl;
  final likes;

  const Post({
    @required this.topic,
    @required this.description,
    @required this.course,
    @required this.uid,
  @required this.username,
  @required this.postId,
  @required this.date,
  @required this.posturl,
  @required this.likes,
  });

  Map<String, dynamic> toJson() => {
    "topic": topic,
    "description": description,
    "course": course,
    "uid": uid,
    "username" : username,
    "postId" : postId,
    "date" : date,
    "posturl" : posturl,
    "likes" : likes,
  };

  static Post fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      topic: snapshot["topic"],
      description: snapshot["description"],
      course: snapshot["course"],
      uid: snapshot["uid"],
      username : snapshot["username"],
      postId : snapshot["postId"],
      date: snapshot["date"],
      posturl : snapshot["posturl"],
      likes : snapshot["likes"],
    );
  }
}