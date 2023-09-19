part of 'item_details_bloc.dart';

@immutable
sealed class ItemDetailsState {}

final class ItemDetailsInitial extends ItemDetailsState {}

final class ItemDetailsFinal extends ItemDetailsState {
  final Map<String, String> itemDetails;
  ItemDetailsFinal({required this.itemDetails});
}
