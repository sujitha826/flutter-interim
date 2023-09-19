part of 'item_details_bloc.dart';

@immutable
sealed class ItemDetailsEvent {}

final class GetItemDetailsEvent extends ItemDetailsEvent {
  final int itemId;
  GetItemDetailsEvent({required this.itemId});
}
