part of 'item_details_bloc.dart';


sealed class ItemDetailsEvent {}

final class GetItemDetailsEvent extends ItemDetailsEvent {
  final int itemId;
  GetItemDetailsEvent({required this.itemId});
}

final class TrackingSuccessEvent extends ItemDetailsEvent {
  TrackingSuccessEvent();
}
