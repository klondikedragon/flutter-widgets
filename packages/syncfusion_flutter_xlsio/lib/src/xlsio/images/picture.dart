part of xlsio;

/// Represent the Excel image.
class Picture {
  /// Create an instances of Picture class.
  Picture(List<int> imageData) {
    img.Image image;
    if (isPng(imageData)) {
      image = img.decodePng(imageData);
    } else if (isJpeg(imageData)) image = img.decodeJpg(imageData);
    _imageData = imageData;
    height = image.height;
    width = image.width;
  }

  static const List<int> _jpegSignature = <int>[255, 216];
  static const List<int> _pngSignature = <int>[137, 80, 78, 71, 13, 10, 26, 10];

  /// Gets/Sets the image data.
  List<int> _imageData;

  /// Gets/Sets the image row.
  ///
  /// ```dart
  /// Workbook workbook = new Workbook();
  /// Worksheet sheet = workbook.worksheets[0];
  /// List<int> bytes = File('image.png').readAsBytesSync();
  /// Picture picture = sheet.picutes.addStream(1, 1, bytes);
  /// picture.row = 2;
  /// List<int> bytes = workbook.saveAsStream();
  /// File('Picutes.xlsx').writeAsBytes(bytes);
  /// workbook.dispose();
  /// ```
  int row;

  /// Gets/Sets the image column.
  ///
  /// ```dart
  /// Workbook workbook = new Workbook();
  /// Worksheet sheet = workbook.worksheets[0];
  /// List<int> bytes = File('image.png').readAsBytesSync();
  /// Picture picture = sheet.picutes.addStream(1, 1, bytes);
  /// picture.column = 2;
  /// List<int> bytes = workbook.saveAsStream();
  /// File('Picutes.xlsx').writeAsBytes(bytes);
  /// workbook.dispose();
  /// ```
  int column;

  /// Gets/Sets the image last row.
  ///
  /// ```dart
  /// Workbook workbook = new Workbook();
  /// Worksheet sheet = workbook.worksheets[0];
  /// List<int> bytes = File('image.png').readAsBytesSync();
  /// Picture picture = sheet.picutes.addStream(1, 1, bytes);
  /// picture.lastRow = 15;
  /// List<int> bytes = workbook.saveAsStream();
  /// File('Picutes.xlsx').writeAsBytes(bytes);
  /// workbook.dispose();
  /// ```
  int lastRow;

  /// Gets/Sets the image last column.
  ///
  /// ```dart
  /// Workbook workbook = new Workbook();
  /// Worksheet sheet = workbook.worksheets[0];
  /// List<int> bytes = File('image.png').readAsBytesSync();
  /// Picture picture = sheet.picutes.addStream(1, 1, bytes);
  /// picture.lastColumn = 15;
  /// List<int> bytes = workbook.saveAsStream();
  /// File('Picutes.xlsx').writeAsBytes(bytes);
  /// workbook.dispose();
  /// ```
  int lastColumn;

  /// Gets/Sets the image width.
  ///
  /// ```dart
  /// Workbook workbook = new Workbook();
  /// Worksheet sheet = workbook.worksheets[0];
  /// List<int> bytes = File('image.png').readAsBytesSync();
  /// Picture picture = sheet.picutes.addStream(1, 1, bytes);
  /// picture.width = 150;
  /// List<int> bytes = workbook.saveAsStream();
  /// File('Picutes.xlsx').writeAsBytes(bytes);
  /// workbook.dispose();
  /// ```
  int width;

  /// Gets/Sets the image height.
  ///
  /// ```dart
  /// Workbook workbook = new Workbook();
  /// Worksheet sheet = workbook.worksheets[0];
  /// List<int> bytes = File('image.png').readAsBytesSync();
  /// Picture picture = sheet.picutes.addStream(1, 1, bytes);
  /// picture.height = 100;
  /// List<int> bytes = workbook.saveAsStream();
  /// File('Picutes.xlsx').writeAsBytes(bytes);
  /// workbook.dispose();
  /// ```
  int height;

  /// Gets/Sets the image horizontal flip.
  ///
  /// ```dart
  /// Workbook workbook = new Workbook();
  /// Worksheet sheet = workbook.worksheets[0];
  /// List<int> bytes = File('image.png').readAsBytesSync();
  /// Picture picture = sheet.picutes.addStream(1, 1, bytes);
  /// picture.horizontalFlip = true;
  /// List<int> bytes = workbook.saveAsStream();
  /// File('Picutes.xlsx').writeAsBytes(bytes);
  /// workbook.dispose();
  /// ```
  bool horizontalFlip = false;

  /// Gets/Sets the image vertical flip.
  ///
  /// ```dart
  /// Workbook workbook = new Workbook();
  /// Worksheet sheet = workbook.worksheets[0];
  /// List<int> bytes = File('image.png').readAsBytesSync();
  /// Picture picture = sheet.picutes.addStream(1, 1, bytes);
  /// picture.verticalFlip = true;
  /// List<int> bytes = workbook.saveAsStream();
  /// File('Picutes.xlsx').writeAsBytes(bytes);
  /// workbook.dispose();
  /// ```
  bool verticalFlip = false;

  /// Gets/Sets the image rotation.
  ///
  /// ```dart
  /// Workbook workbook = new Workbook();
  /// Worksheet sheet = workbook.worksheets[0];
  /// List<int> bytes = File('image.png').readAsBytesSync();
  /// Picture picture = sheet.picutes.addStream(1, 1, bytes);
  /// picture.rotation = 30;
  /// List<int> bytes = workbook.saveAsStream();
  /// File('Picutes.xlsx').writeAsBytes(bytes);
  /// workbook.dispose();
  /// ```
  int rotation = 0;

  /// Gets/Sets the image last row offset.
  double lastRowOffset;

  /// Gets/Sets the image last column offset.
  double lastColOffset;

  /// Gets/Sets the image String.
  List<int> get imageData {
    return _imageData;
  }

  // ignore: prefer_final_fields
  bool _isHyperlink = false;
  Hyperlink _link;

  /// Check whether the picture is png.
  static bool isPng(List<int> imageData) {
    if (imageData.length >= _pngSignature.length) {
      for (int i = 0; i < _pngSignature.length; i++) {
        if (_pngSignature[i] != imageData[i]) {
          return false;
        }
      }
      return true;
    } else {
      return false;
    }
  }

  /// Check whether the picture is jpeg.
  static bool isJpeg(List<int> imageData) {
    if (imageData.length >= _jpegSignature.length) {
      for (int i = 0; i < _jpegSignature.length; i++) {
        if (_jpegSignature[i] != imageData[i]) {
          return false;
        }
      }
      return true;
    } else {
      return false;
    }
  }

  /// clear the image data.
  void _clear() {
    if (_imageData != null) {
      _imageData = null;
    }
  }
}
