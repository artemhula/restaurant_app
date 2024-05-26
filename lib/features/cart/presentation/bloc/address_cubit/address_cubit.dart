import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressLoading());

  Future<void> getAddressFromGeoPoint(GeoPoint point) async {
    emit(AddressLoading());
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(point.latitude, point.longitude, localeIdentifier: 'uk_UA');
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        emit(AddressLoaded(place.locality ?? '', place.street ?? '', place.name ?? ''));
      }
    } catch (e) {
      emit(const AddressFailure('Адресу не знайдено'));
    }
  }
}
