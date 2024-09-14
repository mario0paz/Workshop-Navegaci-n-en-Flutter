import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Workshop-Navegaci-n-en-Flutter/providers/image_providers.dart';

class TabImage extends StatefulWidget {
  final String title;
  final int tabIndex; 

  const TabImage({required this.title, required this.tabIndex, super.key});

  @override
  _TabImageState createState() => _TabImageState();
}

class _TabImageState extends State<TabImage> {
  late int selectedImage;
  late String imageUrl;

  @override
  void initState() {
    super.initState();
    final imageProvider =
        Provider.of<ImageProviderModel>(context, listen: false);
    selectedImage = widget.tabIndex;
    imageUrl = imageProvider.getImageUrlByNumber(selectedImage);
  }

  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImageProviderModel>(context);
    int imageCount = imageProvider.getImageCount();

    return Column(children: [
      Text(widget.title, style: Theme.of(context).textTheme.titleLarge),
      Image.network(imageUrl, width: 300, height: 300),
      DropdownButton<int>(
        items: List.generate(
          imageCount,
          (index) => DropdownMenuItem<int>(
            value: index,
            child: Text(' ${index + 1}'),
          ),
        ),
        value: selectedImage,
        onChanged: (int? value) {
          if (value != null) {
            setState(() {
              selectedImage = value;
              imageUrl = imageProvider.getImageUrlByNumber(selectedImage);
            });
          }
        },
      )
    ]);
  }
}
