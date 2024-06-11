import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/common/widgets/primary_button.dart';
import 'package:restaurant/features/cart/presentation/bloc/address_cubit/address_cubit.dart';
import 'package:restaurant/features/cart/presentation/views/order_screen.dart';
import 'package:restaurant/features/cart/presentation/widgets/location_picker.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});
  static const routeName = '/map';

  @override
  Widget build(BuildContext context) {
    MapController mapController = MapController(
      initPosition:
          GeoPoint(latitude: 46.48562471522167, longitude: 30.73868308142409),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Куди доставляємо?'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          LocationPicker(
            mapController: mapController,
            onMapMoved: (point) {
              context.read<AddressCubit>().getAddressFromGeoPoint(point);
            },
          ),
          BlocBuilder<AddressCubit, AddressState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    if (state is AddressLoading)
                      const CircularProgressIndicator()
                    else if (state is AddressLoaded)
                      Text(
                        state.city == 'Odesa'
                            ? 'Обрана адреса: ${state.city}, ${state.street} ${state.name}'
                            : 'Доставка за цією адресою неможлива',
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    else if (state is AddressFailure)
                      Text(
                        state.error,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    const SizedBox(height: 20),
                    PrimaryButton(
                      onPressed: state is AddressLoaded
                          ? () {
                              Navigator.pushNamed(context, OrderScreen.routeName);
                            }
                          : () {},
                      text: 'Далі',
                      isActive: state is AddressLoaded && state.city == 'Odesa',
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
