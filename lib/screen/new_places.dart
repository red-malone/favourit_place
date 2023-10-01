import 'dart:io';

import 'package:favourite_place/providers/user_places.dart';
import 'package:favourite_place/widgets/inputimage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewPlace extends ConsumerStatefulWidget {
  const NewPlace({super.key});

  @override
  ConsumerState<NewPlace> createState() => _NewPlaceState();
}

class _NewPlaceState extends ConsumerState<NewPlace> {
  final _formkey = GlobalKey<FormState>();
  final _namecontroller = TextEditingController();
  File? _selectedimg;
  String? _imgerror;

  @override
  void dispose() {
    _namecontroller.dispose();
    super.dispose();
  }

  void _save() {
    final enteredText = _namecontroller.text;

    if (_formkey.currentState!.validate()) {
      if (_selectedimg != null) {
        ref
            .read(userPlaceProvider.notifier)
            .addPlace(enteredText, _selectedimg!);

        Navigator.of(context).pop();
      } else {
        setState(() {
          _imgerror = 'No image added , please add';
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new Place'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormField(
                  style: const TextStyle(color: Colors.white),
                  maxLength: 30,
                  decoration: const InputDecoration(label: Text('Place Name')),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length > 50) {
                      return 'Must be between 1 and 30';
                    }
                    return null;
                  },
                  controller: _namecontroller,
                ),
                const SizedBox(
                  height: 5,
                ),
                ImageInput(
                  onPicimg: (image) {
                    setState(() {
                      _selectedimg = image;
                      _imgerror = null;
                    });
                  },
                ),
                if(_imgerror != null)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(_imgerror!,style:Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: const Color.fromARGB(255, 255, 150, 102),
                        fontWeight: FontWeight.w300,
                      ),
                      
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 5,
                ),
                ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text('Add'),
                  onPressed: _save,
                )
              ],
            )),
      ),
    );
  }
}
