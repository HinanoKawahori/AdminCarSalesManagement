import 'package:hooks_riverpod/hooks_riverpod.dart';

class CarManufacturerNotifier extends StateNotifier<String> {
  CarManufacturerNotifier() : super('');

  void setCarManufacturerId(String id) {
    state = id;
  }
}

final carManufacturerProvider =
    StateNotifierProvider<CarManufacturerNotifier, String>((ref) {
  return CarManufacturerNotifier();
});
