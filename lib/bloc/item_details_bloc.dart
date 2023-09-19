import 'package:bloc/bloc.dart';
import 'package:flutter_interim_task/appConstants/constants.dart';
import 'package:meta/meta.dart';

part 'item_details_event.dart';
part 'item_details_state.dart';

class ItemDetailsBloc extends Bloc<ItemDetailsEvent, ItemDetailsState> {
  ItemDetailsBloc() : super(ItemDetailsInitial()) {
    on<ItemDetailsEvent>((event, emit) {});
    on<GetItemDetailsEvent>((event, emit) {
      emit(ItemDetailsFinal(itemDetails: getAllDetails(event.itemId)));
    });
  }

  Map<String, String> getAllDetails(int id) {
    if (id != 0) {
      return {
        'itemDetail': AppConstants.itemDetail,
        'itemImage': 'assets/shoes.jpg',
        'ratingStars': 'assets/stars.png',
        'itemRate': AppConstants.rateOfItem,
        'itemRatingValue': AppConstants.ratingRate
      };
    }
    return {};
  }
}
