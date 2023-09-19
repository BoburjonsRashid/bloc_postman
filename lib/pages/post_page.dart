import 'package:flutter/material.dart';

import '../model/posts_model.dart';
import '../service/http_service.dart';
import '../service/log_service.dart';

class PostPage extends StatefulWidget {
  static const String id = 'EmployeeInfoPage';

  const PostPage({super.key});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  var isLoading = false;
  var users = [];

  TextEditingController titleController = TextEditingController();
  TextEditingController idController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  void _apiPostCreate(Post posts) {
    Network.POST(Network.API_CREATE, Network.paramsCreate(posts))
        .then((response) => {
              LogService.w(response.toString()),
            });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Center(
          child: SizedBox(
            width: 300,
            height: 300,
            child: Column(
              children: [
                Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'title'),
                      controller: titleController,
                    ), // TextFormField
                    TextFormField(
                      decoration: const InputDecoration(labelText: 'body'),
                      controller: bodyController,
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      var posts = Post(
                        title: titleController.text.toString().trim(),
                        body: bodyController.text.toString().trim(),
                      );
                      _apiPostCreate(posts);

                      Navigator.pop(context);
                    });
                  },
                  child: Container(
                    width: 150,
                    height: 40,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(22)),
                        color: Colors.blueAccent
                        // No such attribute
                        ),
                    child: const Center(
                      child: Text(
                        'Save',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
