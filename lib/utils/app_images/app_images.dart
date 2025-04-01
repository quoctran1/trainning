import 'package:flutter/material.dart';

class AppImages {
  static const String routeAssets = 'assets/images/';

  static const String icPlusPlus = 'assets/images/ic_add_orange.svg';
  static const String icPlusFlipCard = '${routeAssets}ic_plus_flip_card.svg';
  static const String flipCardBackground =
      '${routeAssets}flip_card_background.png';
  static const String icFlipCard = '${routeAssets}ic_flip_card.svg';
  static const String icProfileGem = '${routeAssets}ic_profile_gem.svg';

}

class AppConstant {
  static const double defaultMargin = 16;
  static const String defaultUsername='N/A';


}

class AppColor {
  static Color pilaYellow = const Color(0xFFFFFC55);
  static const Color autumnChild = Color(0xFFFBE7C1);
  static const Color whiteDesert = Color(0xFFFEFAF3);
  static const Color white = Color(0xFFFFFFFF);
  static const Color piecesOfEight = Color(0xFFFFAE38);
  static const Color mountainMeadow = Color(0xFF5683E6);
  static Color vanillaIceCream = const Color(0xFFFFE6B3);
  static Color gustoGold = const Color(0xFFF9B21F);





}

class NativeCodeBridge {
  // Declares an external function. Implementation will be provided elsewhere.
  external static int nativeAdd(int a, int b);
}

class Im {
  void add() {
    NativeCodeBridge.nativeAdd(1, 2);
  }
}
