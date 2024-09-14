import 'package:flutter/material.dart';

class ImageProviderModel with ChangeNotifier {
  final List<String> _imageUrls = [
    'https://images8.alphacoders.com/135/thumb-1920-1350086.jpeg',
    'https://images5.alphacoders.com/134/thumb-1920-1345309.jpeg',
    'https://images5.alphacoders.com/481/thumb-1920-481903.png',
  ];

  int _selectedImageNumber = 0;

  List<String> get imageUrls => List.unmodifiable(_imageUrls);

  String get selectedImageUrl => _imageUrls.elementAtOrDefault(_selectedImageNumber);

  void setImages(List<String> imageUrls) {
    _imageUrls
      ..clear()
      ..addAll(imageUrls);
    notifyListeners();
  }

  int getImageCount() => _imageUrls.length;

  void updateSelectedImageNumber(int number) {
    if (number.isValidIndex(_imageUrls.length)) {
      _selectedImageNumber = number;
      notifyListeners();
    } else {
      print('Índice fuera de rango: $number');
    }
  }
}

// Extensión para manejar índices de forma segura
extension ListExtension<T> on List<T> {
  T elementAtOrDefault(int index, {T? defaultValue}) {
    return (index >= 0 && index < length) ? this[index] : defaultValue ?? this.first;
  }
}

extension IndexValidator on int {
  bool isValidIndex(int length) => this >= 0 && this < length;
}
