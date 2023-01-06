import 'package:flutter/material.dart';
import 'package:jobprovider/app/core/resources/color_manager.dart';

import '../resources/assets_manager.dart';


class BuildScaffold extends StatelessWidget {
  const BuildScaffold({super.key, required this.body, this.backgroundImg});
  final String? backgroundImg;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: new BoxDecoration(
                color: ColorManager.white,
              ),
            ),
            Image.asset(
              backgroundImg == null
                  ? ImageAssets.getstartedbg
                  : backgroundImg!,
              fit: BoxFit.cover,
            ),
            body
          ],
        ),
      ),
    );
  }
}
