import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/cart/domain/entity/order.dart';
import 'package:restaurant/features/cart/domain/usecases/create_order.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit(this.createOrder) : super(OrderInitial());
  final CreateOrder createOrder;

  void sendOrder(OrderEntity order) async {
    emit(OrderLoading());
    final result = await createOrder(order);
    result.fold(
      (failure) => emit(OrderFailure()),
      (success) => emit(OrderSuccess()),
    );
  }
}
