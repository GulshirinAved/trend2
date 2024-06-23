import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trend_marketplace2/data/models/favItem_model.dart';

part 'fav_button_event.dart';
part 'fav_button_state.dart';

class FavButtonBloc extends Bloc<FavButtonEvent, FavButtonState> {
  FavButtonBloc() : super(const FavButtonInitial(favList: [])) {
    on<ToggleFavEvent>((event, emit) {
      final existingIndex =
          state.favList.indexWhere((item) => item.id == event.item.id);
      final List<FavItem> updatedFavList = List.from(state.favList);

      if (existingIndex != -1) {
        updatedFavList.removeAt(existingIndex);
      } else {
        updatedFavList.add(event.item);
      }

      emit(SuccessState(favList: updatedFavList));
    });
  }
}
