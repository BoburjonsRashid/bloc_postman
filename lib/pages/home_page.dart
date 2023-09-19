import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/list_post_cubit.dart';
import '../bloc/list_post_state.dart';
import '../model/posts_model.dart';
import '../views/view_of_home.dart';


class HomePage extends StatefulWidget {
  final Post? posts;

  const HomePage({super.key, this.posts});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List <Post> items=[];
  @override
   initState() {
    super.initState();
    BlocProvider.of<ListPostCubit>(context).apiPostList();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text(""
        "Postman BloC"),),
        floatingActionButton: FloatingActionButton(
          onPressed: ()  =>  BlocProvider.of<ListPostCubit>(context).callCreatePage(context),

          backgroundColor: Colors.green,
          child: const Icon(Icons.add),
        ),
        body: BlocBuilder<ListPostCubit, ListPostState>(
          builder: (BuildContext context, ListPostState state) {
            if (state is ListPostError) {
              return viewOfHome(items, false); //error
            }
            if (state is ListPostLoaded) {
               items = state.posts!;
              return viewOfHome(items,false); //posts
            }
            return viewOfHome(items, true); //loading
          },
        ));
  }

}







// body: BlocBuilder<ListPostCubit, ListPostState>(
// builder: (BuildContext context, ListPostState state) {
// if (state is ListPostError) {
// return viewPostError(state.error);
// }
// if (state is ListPostLoaded) {
// var items = state.posts;
// return viewPostList(items!);
// }
// return viewPostLoading();
// },
// ));
// }

// Widget viewPostError(String err) {
// return Center(
// child: Text(err),
// );
// }
// Widget viewPostList(List<Posts> items) {
// return ListView.builder(
// itemCount: items.length,
// itemBuilder: (ctx,index){
// return itemHomePost(items[index]);
// },
// );
// }
// Widget viewPostLoading() {
// return const Center(
// child: CircularProgressIndicator(),
// );
// }
