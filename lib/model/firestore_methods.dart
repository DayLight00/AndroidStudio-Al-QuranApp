import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:al_quran/model/postmodel.dart';
import 'storage_method.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> uploadPost(
      String topic,
      String description,
      String course,
      Uint8List file,
      String uid,
      String username,)
  async {
    String res = "some error occured";
    try {
      String photoUrl = await StorageMethods().uploadImageToStorage('post', file, true);

      String postId = const  Uuid().v1();
      Post post = Post(
        topic: topic,
        description: description,
        course: course,
        uid: uid,
        username: username,
        postId: postId,
        date: DateTime.now(),
        posturl: photoUrl,
        likes: [],
      );

      _firestore.collection('posts').doc(postId).set(post.toJson(),);
      res = "success";

      } catch(err){
      res = err.toString();
        }
        return res;
    }

    Future<void> likePost(String postId, String uid, List likes) async {
    try{
      if(likes.contains(uid)){
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayRemove([uid]),
        });
      }
      else{
        await _firestore.collection('posts').doc(postId).update({
          'likes': FieldValue.arrayUnion([uid]),
        });
      }
    }catch(e){
      print(e.toString(),);
    }
    }
    
    Future<void> postComment(String postId, String text, String uid, String name,) async {
    
      try{
        
        if(text.isNotEmpty){
          String commentId = const Uuid().v1();
          _firestore.collection('posts').doc(postId).collection('comments').doc(commentId).set({
            'name':name,
            'uid':uid,
            'text':text,
            'commentId':commentId,
            'date': DateTime.now(),
          });
        }
        else {
         print('Text is empty');
        }
      }
      catch (e){
        print(e.toString());
      }
    }
    //************************************ DELETE POST ************************************
  Future <void> deletePost(String postId) async {
    try{
      await _firestore.collection('posts').doc(postId).delete();
    }
    catch (err){
      print(err.toString());
    }
  }

    
  }


