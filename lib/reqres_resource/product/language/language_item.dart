enum ProjectString { appBarName }

extension ProjectStringExtension on ProjectString {
  String languageItem() {
    switch (this) {
      case ProjectString.appBarName:
        return 'Color Palette';
    }
  }
}
