import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final userRef = FirebaseFirestore.instance.collection('user');
final forumRef = FirebaseFirestore.instance.collection('Forum');
final postRef = FirebaseFirestore.instance.collection('posts');
final chatRef = FirebaseFirestore.instance.collection('chats');

//********************************DATA FOR USER ONLY*********************************************************
class UserModel {
  String uid;
  String email;
  String nickname;
  String name;
  String role;
  String programCode;

  UserModel({this.uid, this.email, this.nickname, this.name, this.role, this.programCode});

  //Retrieve data from server
  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      email: map['email'],
      nickname: map['nickname'],
      name: map['name'],
      role: map['role'],
      programCode: map['programCode'],
    );
  }
  //Send data to server
  Map<String, dynamic> toMap(){
    return{
      'uid': uid,
      'email':email,
      'nickname':nickname,
      'name':name,
      'role':role,
      'programCode': programCode,
    };
  }

  static UserModel fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      uid: snapshot['uid'],
      email: snapshot['email'],
      nickname: snapshot['nickname'],
      name: snapshot['name'],
      role: snapshot['role'],
      programCode: snapshot['programCode']
    );
  }

}
//TO RETRIEVE DATA BASE ON REFERENCE AKA TYPING
class DatabaseMethod {

  harapjadi() async  {
    return await userRef
        .get();
  }
//SEARCH USER
   handleSearch(String nickenter) async  {
     return await userRef
        .where("nickname" , isEqualTo: nickenter  )
        .get();
  }

  testSearch(String nickenter) async  {
    return await chatRef
        .where("user2", isEqualTo: nickenter  )
        .get();
  }

  testSearch2(String nickenter) async  {
    return await chatRef
        .where("user1", isEqualTo: nickenter  )
        .get();
  }



   getRole(String role) async  {
     return await userRef
         .where("role", isEqualTo: role)
         .get();
   }

   getProgramCode(String code) async  {
     return await userRef
         .where("programCode", isEqualTo: code)
         .get();
   }


//SEARCH FORUM
   handleSearchForum(String nickenter) async  {
     return await forumRef
         .where("nickname", isGreaterThanOrEqualTo: nickenter)
         .get();
   }
//DISPLAY FORUM FOR CURRENT USER ONLY
   handleForum(String userid) async  {
     return await forumRef
         .where("uid", isEqualTo: userid)
         .get();
   }
//DISPLAY FORUM FOR ALL USER
  handleForumAll(String userid) async  {
    return await forumRef
        .where("nickname", isGreaterThanOrEqualTo: userid)
        .get();
  }

  handleForumnew(String userid) async  {
    return await postRef
        .where("nickname", isGreaterThanOrEqualTo: userid)
        .get();
  }


}

//********************************DATA FOR FORUM ONLY*********************************************************
class ForumModel {
  String uid;
  String nickname;
  String topic;
  String desc;
  String file;
  final date;
  String forumID;

  ForumModel({this.uid, this.nickname, this.topic, this.desc, this.file,this.date, this.forumID});

  //Retrieve data from server
  factory ForumModel.fromMap(map){
    return ForumModel(
      uid: map['uid'],
      nickname: map['nickname'],
      topic: map['topic'],
      desc: map['desc'],
      file: map['file'],
      date: map['date'],
      forumID: map['forumID'],

    );
  }
  //Send data to server
  Map<String, dynamic> toMap(){
    return{
      'uid': uid,
      'nickname':nickname,
      'topic':topic,
      'desc':desc,
      'file':file,
      'date':date,
      'forumID': forumID,
    };
  }
}