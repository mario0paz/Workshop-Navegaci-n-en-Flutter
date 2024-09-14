import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:Workshop-Navegaci-n-en-Flutter/providers/image_providers.dart';

class ViewImage extends StatelessWidget {
  const ViewImage({super.key});
  @override
  Widget build(BuildContext context) {
    final imageProvider = Provider.of<ImageProviderModel>(context);
    final imageUrls = imageProvider.imageUrls;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('View Image'),
        ),
        body: Center(
          child: SizedBox(
            width: double.infinity,
            height: 300,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.network(
                  imageUrls[index],
                  fit: BoxFit.fill,
                );
              },
              itemCount: 3,
              viewportFraction: 0.8,
              scale: 0.9,
              pagination: const SwiperPagination(),
              control: const SwiperControl(),
            ),
          ),
        ),
      ),
    );
  }
}
