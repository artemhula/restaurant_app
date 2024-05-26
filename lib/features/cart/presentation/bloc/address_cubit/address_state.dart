part of 'address_cubit.dart';

sealed class AddressState extends Equatable {
  const AddressState();
  @override
  List<Object> get props => [];
}

class AddressLoading extends AddressState {}

class AddressLoaded extends AddressState {
  const AddressLoaded(this.city, this.street, this.name);
  final String city;
  final String street;
  final String name;

  @override
  List<Object> get props => [city, street, name];
}

class AddressFailure extends AddressState {
  const AddressFailure(this.error);
  final String error;

  @override
  List<Object> get props => [error];
}
