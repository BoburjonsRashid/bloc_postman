import 'package:equatable/equatable.dart';

import '../model/posts_model.dart';


abstract class ListPostState extends Equatable {
  @override
  List<Object> get props => [];
}

class ListPostInit extends ListPostState {}

class ListPostLoading extends ListPostState {}

class ListPostLoaded extends ListPostState {
  late final List<Post>? posts;
  ListPostLoaded({this.posts});
}

class ListPostError extends ListPostState {
  late final error;
  ListPostError({this.error});
}
