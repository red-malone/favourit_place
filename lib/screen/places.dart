import 'package:favourite_place/providers/user_places.dart';
import 'package:favourite_place/screen/new_places.dart';
import 'package:favourite_place/widgets/place_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlaceScreen extends ConsumerStatefulWidget {
  const PlaceScreen({super.key});

  @override
  ConsumerState<PlaceScreen> createState() => _PlaceScreenState();
}

class _PlaceScreenState extends ConsumerState<PlaceScreen> {
  @override
  Widget build(BuildContext context) {
    final _userplaces = ref.watch(userPlaceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const NewPlace()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body:  PlaceList(places: _userplaces),
    );
  }
}
