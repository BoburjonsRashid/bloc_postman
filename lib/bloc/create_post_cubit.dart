import 'package:flutter_bloc/flutter_bloc.dart';


import '../model/posts_model.dart';
import '../service/http_service.dart';
import 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(CreatePostInit());

  void apiPostCreate(Post post) async {
    emit(CreatePostLoading());
    final response =
        await Network.POST(Network.API_CREATE, Network.paramsCreate(post));
    print(response);
    if (response != null) {
      emit(CreatePostLoaded(isCreated: true));
    } else {
      emit(CreatePostError(error: "Could not create post"));
    }
  }
}
