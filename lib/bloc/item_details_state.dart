part of 'item_details_bloc.dart';

abstract class ItemDetailsState {}

final class ItemDetailsInitial extends ItemDetailsState {}

final class ItemDetailsFinal extends ItemDetailsState {
  final Map<String, String> itemDetails;
  ItemDetailsFinal({required this.itemDetails});
}


// seperate this logic to another bloc for better state handling(aim here done is only for understanding the approach)
class TrackingSuccessState extends ItemDetailsState {
  final String success;
  TrackingSuccessState({required this.success});
}
