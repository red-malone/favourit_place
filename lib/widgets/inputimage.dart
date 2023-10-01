import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onPicimg});

  final void Function(File image) onPicimg;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _takenimg;

  void _takepic() async {
    final imagepicker = ImagePicker();
    final pickedimg = await imagepicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    );

    if (pickedimg == null) {
      return;
    }

    setState(() {
      _takenimg = File(pickedimg.path);
    });

    widget.onPicimg(_takenimg!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      icon: const Icon(Icons.camera),
      label: const Text('Take Picture'),
      onPressed: _takepic,
    );

    if (_takenimg != null) {
      content = GestureDetector(
        onTap: _takepic,
        child: Image.file(
          _takenimg!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      );
    }

    final height = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
              width: 1,
              color: Theme.of(context).colorScheme.primary.withOpacity(.5))),
      padding: const EdgeInsets.all(4),
      width: double.infinity,
      alignment: Alignment.center,
      height: height / 3,
      child: content,
    );
  }
}
