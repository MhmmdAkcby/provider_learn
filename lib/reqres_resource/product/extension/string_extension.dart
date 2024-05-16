extension ColorStringExtension on String? {
  int get colorValue {
    var newColor = this?.replaceAll('#', '0xff') ?? '';
    return int.parse(newColor);
  }
}
