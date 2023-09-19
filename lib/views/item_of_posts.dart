

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/list_post_cubit.dart';
import '../model/posts_model.dart';
import '../pages/update_page.dart';



void callUpdatePage( context,Post post )async {
  print(post.toJson());
  var results = await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => UpdatePage(
        post: post,
      )));
  if (results != null) {
    BlocProvider.of<ListPostCubit>(context).apiPostList();
  }


}
Widget itemOfPost(BuildContext context, Post posts) {
  return Slidable(
    startActionPane: ActionPane(
      extentRatio: 0.35,
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (BuildContext context) {
           callUpdatePage(context, posts);
          },
          backgroundColor: const Color(0xFF21B7CA),
          foregroundColor: Colors.white,
          icon: Icons.update,
          label: 'Update',
        ),
      ],
    ),

    endActionPane: ActionPane(
      extentRatio: 0.35,
      motion: const ScrollMotion(),
      children: [
        SlidableAction(
          onPressed: (BuildContext context) {
            BlocProvider.of<ListPostCubit>(context).apiPostDelete(posts);
          },
          backgroundColor: const Color(0xFFFE4A49),
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
      ],
    ),
    child: Container(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            posts.title!.toUpperCase(),
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(posts.body!),
        ],
      ),
    ),
  );
}