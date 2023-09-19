// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/posts_model.dart';
import '../pages/create_page.dart';
import '../pages/update_page.dart';
import '../service/http_service.dart';
import 'list_post_state.dart';

class ListPostCubit extends Cubit<ListPostState> {
  ListPostCubit() : super (ListPostInit());

  void apiPostList()async{
    emit(ListPostLoading());
    final response=await Network.GET(Network.API_LIST, Network.paramsEmpty());
    if(response!=null){
      emit(ListPostLoaded(posts: Network.parsecPostList(response)));
    }
    else{
      emit(ListPostError(error: "Couldn't fetch posts"));

    }


  }void apiPostDelete(Post post) async {
    emit(ListPostLoading());
    final response = await Network.DEL(
        Network.API_DELETE + post.id.toString(), Network.paramsEmpty());
    print(response);
    if (response != null) {
      apiPostList();
    } else {
      emit(ListPostError(error: "Couldn't delete post"));
    }
  }

  void callCreatePage(BuildContext context) async {
    var results = await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => CreatePage()));
    if (results != null) {
      BlocProvider.of<ListPostCubit>(context).apiPostList();
    }
  }
}