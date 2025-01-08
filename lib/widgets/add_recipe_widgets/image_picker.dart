import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  final Function(File?) onImageSelected;

  const ImagePickerWidget({super.key, required this.onImageSelected});

  @override
  // ignore: library_private_types_in_public_api
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? _imageFile;

  void _showOption(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Choose an option'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Gallery'),
              onTap: () => _imageFromGallery(context),
            ),
            ListTile(
              leading: const Icon(Icons.camera),
              title: const Text('Camera'),
              onTap: () => _imageFromCamera(context),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _imageFromGallery(BuildContext context) async {
    Navigator.of(context).pop();
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      widget.onImageSelected(_imageFile);
    }
  }

  Future<void> _imageFromCamera(BuildContext context) async {
    Navigator.of(context).pop();
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
      widget.onImageSelected(_imageFile);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(207, 255, 255, 255),
            border: Border.all(color: const Color.fromARGB(255, 12, 126, 16)),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Select Image:',
                      style: TextStyle(
                          color: Color.fromARGB(216, 57, 57, 57),
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.image,
                    color: Color.fromARGB(255, 12, 126, 16),
                  ),
                  onPressed: () => _showOption(context),
                ),
              ],
            ),
          ),
        ),
        if (_imageFile != null)
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Image.file(
              _imageFile!,
              height: 100,
              width: 100,
              fit: BoxFit.cover,
            ),
          )
        else
          const SizedBox(height: 10),
      ],
    );
  }
}
