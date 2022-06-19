import 'package:flutter/material.dart';

class ForumModel {

  String postID;
  String uid;
  String nickname;
  String mediaUrl;
  String topic;
  String desc;
  dynamic likes;


  ForumModel({this.postID, this.uid, this.nickname, this.mediaUrl, this.topic,this.desc,this.likes});

  //Retrieve data from server

  factory ForumModel.fromMap(map){
    return ForumModel(

      postID: map['postID'],
      uid: map['uid'],
      nickname: map['nickname'],
      mediaUrl: map['mediaUrl'],
      topic: map['topic'],
      desc: map['desc'],
      likes: map['likes'],

    );
  }

  //Send data to server

  Map<String, dynamic> toMap(){
    return{
      'postID': postID,
      'uid':uid,
      'nickname':nickname,
      'mediaUrl':mediaUrl,
      'topic':topic,
      'desc':desc,
      'likes':likes,

    };
  }


}