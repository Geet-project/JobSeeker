/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/appfastlogo.png
  AssetGenImage get appfastlogo =>
      const AssetGenImage('assets/images/appfastlogo.png');

  /// File path: assets/images/appicon.png
  AssetGenImage get appicon => const AssetGenImage('assets/images/appicon.png');

  /// File path: assets/images/bannerimg.png
  AssetGenImage get bannerimg =>
      const AssetGenImage('assets/images/bannerimg.png');

  /// File path: assets/images/cvimg.png
  AssetGenImage get cvimg => const AssetGenImage('assets/images/cvimg.png');

  /// File path: assets/images/dollar_sign.png
  AssetGenImage get dollarSign =>
      const AssetGenImage('assets/images/dollar_sign.png');

  /// File path: assets/images/donemark.png
  AssetGenImage get donemark =>
      const AssetGenImage('assets/images/donemark.png');

  /// File path: assets/images/drawericon.png
  AssetGenImage get drawericon =>
      const AssetGenImage('assets/images/drawericon.png');

  /// File path: assets/images/fastracklogo.png
  AssetGenImage get fastracklogo =>
      const AssetGenImage('assets/images/fastracklogo.png');

  /// File path: assets/images/forgetpasswordimg.png
  AssetGenImage get forgetpasswordimg =>
      const AssetGenImage('assets/images/forgetpasswordimg.png');

  /// File path: assets/images/getstartedbg.png
  AssetGenImage get getstartedbg =>
      const AssetGenImage('assets/images/getstartedbg.png');

  /// File path: assets/images/profilepic.jpg
  AssetGenImage get profilepic =>
      const AssetGenImage('assets/images/profilepic.jpg');

  /// File path: assets/images/splashbg.png
  AssetGenImage get splashbg =>
      const AssetGenImage('assets/images/splashbg.png');

  /// File path: assets/images/timerimg.png
  AssetGenImage get timerimg =>
      const AssetGenImage('assets/images/timerimg.png');

  /// File path: assets/images/vehicle.png
  AssetGenImage get vehicle => const AssetGenImage('assets/images/vehicle.png');

  /// File path: assets/images/verifyemailimg.png
  AssetGenImage get verifyemailimg =>
      const AssetGenImage('assets/images/verifyemailimg.png');

  /// File path: assets/images/waitingimg.png
  AssetGenImage get waitingimg =>
      const AssetGenImage('assets/images/waitingimg.png');

  /// File path: assets/images/whitebg.png
  AssetGenImage get whitebg => const AssetGenImage('assets/images/whitebg.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        appfastlogo,
        appicon,
        bannerimg,
        cvimg,
        dollarSign,
        donemark,
        drawericon,
        fastracklogo,
        forgetpasswordimg,
        getstartedbg,
        profilepic,
        splashbg,
        timerimg,
        vehicle,
        verifyemailimg,
        waitingimg,
        whitebg
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
