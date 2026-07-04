import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadPhoto extends StatefulWidget {
  const UploadPhoto({super.key});

  @override
  State<UploadPhoto> createState() => _UploadPhotoState();
}

class _UploadPhotoState extends State<UploadPhoto> {
  final ImagePicker _picker = ImagePicker();
  XFile? _pickedImage;
  dynamic _pickImageError;

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      setState(() {
        _pickedImage = image;
        _pickImageError = null;
      });
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeColors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: 100,
                height: 100,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: themeColors.secondaryContainer,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Icon(
                  Icons.add_a_photo_outlined,
                  color: themeColors.onSecondaryContainer,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: RichText(
                  softWrap: true,
                  text: TextSpan(
                    style: TextStyle(
                      fontSize: 15,
                      color: themeColors.onSurface,
                    ),
                    children: [
                      TextSpan(text: 'Toque para escolher a'),
                      TextSpan(
                        text: ' capa ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: 'do jogo'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        if (_pickImageError != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              softWrap: true,
              textAlign: TextAlign.justify,
              'Erro ao selecionar selecionar imagem: $_pickImageError',
              style: TextStyle(
                color: themeColors.error,
                fontSize: 13,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          )
        else if (_pickedImage != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              softWrap: true,
              textAlign: TextAlign.justify,
              'Imagem selecionada com sucesso!',
              style: TextStyle(
                color: Colors.green,
                fontSize: 13,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
          ),
      ],
    );
  }
}
