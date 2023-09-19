import 'package:bloc_postman/pages/update_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../model/posts_model.dart';
import 'inform_page.dart';


class ItemHomePost extends StatefulWidget {
  final Post? posts;
  final Function() getList;
  final Function(Post? posts) delete;

  const ItemHomePost({
    super.key,
    required this.getList,
    required this.delete,
    this.posts,
  });

  @override
  State<ItemHomePost> createState() => _ItemHomePostState();
}

class _ItemHomePostState extends State<ItemHomePost> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (BuildContext context) {
              setState(() {
                widget.delete(widget.posts);
              });
            },
            flex: 3,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: "delete",
          ),
        ],
      ),
      startActionPane: ActionPane(
        extentRatio: 0.25,
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (BuildContext context) async{
              await Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return UpdatePage(post: widget.posts);
                  }));
              widget.getList();

            },
            flex: 3,
            backgroundColor: Colors.deepPurpleAccent,
            foregroundColor: Colors.white,
            icon: Icons.update,
            label: "update",
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return InformPage(name: widget.posts?.title ?? "");
          }));
        },
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.posts?.title!.toUpperCase() ?? 'jj',
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                widget.posts?.body ?? 'jj',
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ), // SizedBox
              Text(widget.posts?.id.toString() ?? '')
            ],
          ),
        ),
      ),
    );
  }
}
