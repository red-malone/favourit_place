import 'dart:io';

import 'package:favourite_place/model/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  void addPlace(String name,File image) {
    final newPlace = Place(title: name,image: image);
    state = [newPlace, ...state];
  }
}

final userPlaceProvider = StateNotifierProvider<UserPlacesNotifier,List<Place>>((ref) => UserPlacesNotifier());
