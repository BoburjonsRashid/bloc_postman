import 'package:bloc_postman/bloc/update_post_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/posts_model.dart';
import '../service/http_service.dart';

class UpdatePostCubit extends Cubit<UpdatePostState> {
  UpdatePostCubit() : super(UpdatePostInit());

  void apiPostUpdate(Post post) async {
    emit(UpdatePostLoading());
    final response =
        await Network.PUT(Network.API_UPDATE+post.id.toString(), Network.paramsUpdate(post));
    print(response);
    if (response != null) {
      emit(UpdatePostLoaded(isUpdated: true));
    } else {
      emit(UpdatePostError(error: "Could not update post"));
    }
  }
}
