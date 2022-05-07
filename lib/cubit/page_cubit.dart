import 'package:bloc/bloc.dart';

class PageCubit extends Cubit<int> {
  PageCubit() : super(0);

  void SetPage(int newPage) {
    emit(newPage);
  }
}
