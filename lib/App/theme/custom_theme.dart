import 'package:flutter/material.dart';

class CustomTheme extends ThemeExtension<CustomTheme> {
  final Color? buttonColor;
  final BoxDecoration? paletteDecoration;
  final TextStyle? textstyles;
  final BoxDecoration? decorationbox;
  final BoxDecoration? decorationfloating;
  final BoxDecoration? imageBackground;
  final TextStyle? parkText;
  final TextStyle? inText;
  final TextStyle? lineTextParkIn;
  final BoxDecoration? decorationButton;
  final BoxDecoration? decorationBoxRodape;
  final BoxDecoration? decorationContainer;
  final TextStyle? textstylesTitle;
  final TextStyle? textStylesButton;
  final BoxDecoration? imageDrawer;
  final TextStyle? textDrawer;
  final TextStyle? textstylesTitleRodape;

  CustomTheme({
    required this.buttonColor,
    required this.paletteDecoration,
    this.textstyles,
    this.decorationbox,
    this.decorationfloating,
    this.imageBackground,
    this.inText,
    this.parkText,
    this.lineTextParkIn,
    this.decorationButton,
    this.decorationBoxRodape,
    this.decorationContainer,
    this.textstylesTitle,
    this.textStylesButton,
    this.imageDrawer,
    this.textDrawer,
    this.textstylesTitleRodape,
  });

  @override
  CustomTheme copyWith({
    Color? buttonColor,
    BoxDecoration? paletteDecoration,
    TextStyle? textStyles,
    BoxDecoration? decorationbox,
    decorationfloating,
    BoxDecoration? imageBackground,
    TextStyle? inText,
    TextStyle? parkText,
    TextStyle? lineTextParkIn,
    BoxDecoration? decorationButton,
    BoxDecoration? decorationBoxRodape,
    BoxDecoration? decorationContainer,
    TextStyle? textstylesTitle,
    TextStyle? textStylesButton,
    BoxDecoration? imageDrawer,
    TextStyle? textDrawer,
    TextStyle? textstylesTitleRodape,
  }) {
    return CustomTheme(
      buttonColor: buttonColor ?? this.buttonColor,
      paletteDecoration: paletteDecoration ?? this.paletteDecoration,
      textstyles: textstyles ?? textstyles,
      decorationbox: decorationbox ?? this.decorationbox,
      decorationfloating: decorationfloating ?? this.decorationfloating,
      imageBackground: imageBackground ?? this.imageBackground,
      parkText: parkText ?? this.parkText,
      inText: inText ?? this.inText,
      lineTextParkIn: lineTextParkIn ?? this.lineTextParkIn,
      decorationButton: decorationButton ?? this.decorationButton,
      decorationBoxRodape: decorationBoxRodape ?? this.decorationBoxRodape,
      decorationContainer: decorationContainer ?? this.decorationContainer,
      textstylesTitle: textstylesTitle ?? this.textstylesTitle,
      textStylesButton: textStylesButton ?? this.textStylesButton,
      imageDrawer: imageDrawer ?? this.imageDrawer,
      textDrawer: textDrawer ?? this.textDrawer,
      textstylesTitleRodape: textstylesTitleRodape ?? this.textstylesTitleRodape,
    );
  }

  @override
  CustomTheme lerp(ThemeExtension<CustomTheme>? other, double t) {
    if (other is! CustomTheme) {
      return this;
    }
    return CustomTheme(
      buttonColor: Color.lerp(buttonColor, other.buttonColor, t),
      paletteDecoration:
          BoxDecoration.lerp(paletteDecoration, other.paletteDecoration, t),
      textstyles: TextStyle.lerp(textstyles, other.textstyles, t),
      decorationbox:
          BoxDecoration.lerp(decorationbox, other.decorationbox, t),
      decorationfloating:
          BoxDecoration.lerp(decorationfloating, other.decorationfloating, t),
      imageBackground:
          BoxDecoration.lerp(imageBackground, other.imageBackground, t),
      parkText: TextStyle.lerp(parkText, other.parkText, t),
      inText: TextStyle.lerp(inText, other.inText, t),
      lineTextParkIn: TextStyle.lerp(lineTextParkIn, other.lineTextParkIn, t),
      decorationButton:
          BoxDecoration.lerp(decorationButton, other.decorationButton, t),
      decorationBoxRodape: BoxDecoration.lerp(
          decorationBoxRodape, other.decorationBoxRodape, t),
      decorationContainer: BoxDecoration.lerp(
          decorationContainer, other.decorationContainer, t),
      textstylesTitle:
          TextStyle.lerp(textstylesTitle, other.textstylesTitle, t),
      textStylesButton:
          TextStyle.lerp(textStylesButton, other.textStylesButton, t),
      imageDrawer: BoxDecoration.lerp(imageDrawer, other.imageDrawer, t),
      textDrawer: TextStyle.lerp(textDrawer, other.textDrawer, t),
      textstylesTitleRodape: TextStyle.lerp(textstylesTitleRodape, other.textstylesTitleRodape, t),
    );
  }
}
