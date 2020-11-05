import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String title;

  CategoryModel(this.title);

  @override
  List<Object> get props => [title];
}
