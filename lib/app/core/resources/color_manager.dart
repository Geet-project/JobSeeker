import 'dart:ui';

class  ColorManager{
  static Color primary = HexColor.fromHex("#982E53");
  static Color lightPrimary = HexColor.fromHex("#FBBC3D");
  static Color lightGreen = HexColor.fromHex("#63F672");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#737477");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color lightGrey1 = HexColor.fromHex("#A2A2A2");
  static Color lightGrey2 = HexColor.fromHex("#C2C2C2");
  static Color lightwhite = HexColor.fromHex("#F3F3F3");
  static Color primaryOpacity70 = HexColor.fromHex("#B3ED9728");
  // new colors
  static Color darkPrimary = HexColor.fromHex("#d17d11");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color redColor = HexColor.fromHex("#EC1505");

  static Color grey2 = HexColor.fromHex("#797979");
  static Color grey4 = HexColor.fromHex("#77A2AE");
   static Color grey3 = HexColor.fromHex("#8E8F91");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color error = HexColor.fromHex("#e61f34");
  static Color black= HexColor.fromHex("#000000"); // black color
  static Color blacklight = HexColor.fromHex("#444444");
  static Color darkGreen= HexColor.fromHex("#44D7B6");

  static Color offWhite= HexColor.fromHex("#EEF1EF");
  static Color blue= HexColor.fromHex("#EBFDFF");
  static Color lightBlue= HexColor.fromHex("#77F1FF");
  static Color projectBlack= HexColor.fromHex("#393939");
  static Color blueColor = HexColor.fromHex("#3CC7EC");
  static Color lightBlue1 = HexColor.fromHex("#E1F9FF");
  static Color lightBlue2 = HexColor.fromHex("#C9F0FB");

  static Color lightBlue3 = HexColor.fromHex("#EFFBFE");


  static Color orangeColor = HexColor.fromHex("#FEA100");
  static Color darkBlue = HexColor.fromHex("#5177DF");
  static Color textColor= HexColor.fromHex("#919090"); // black color









}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll("#", '');
    if(hexColorString.length==6) {
      hexColorString = "FF"+ hexColorString; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}