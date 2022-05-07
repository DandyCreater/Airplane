import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:splashscreen/cubit/models/DestinationModel.dart';
import 'package:splashscreen/cubit/services/DestinationService.dart';

part 'destination_state.dart';

class DestinationCubit extends Cubit<DestinationState> {
  DestinationCubit() : super(DestinationInitial());

  void fetchDestinations() async {
    try {
      emit(DestinationLoading());
      List<DestinationModel> destinations =
          await DestinationService().fetchDestinations();

      emit(DestinationSuccess(destinations));
    } catch (e) {
      emit(DestinationFailed(e.toString()));
    }
  }
}
