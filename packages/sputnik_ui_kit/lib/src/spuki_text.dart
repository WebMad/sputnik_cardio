import 'package:flutter/material.dart';
import 'package:sputnik_ui_kit/src/spuki_theme_data.dart';

class SpukiText extends StatelessWidget {
  final String data;
  final SpukiFontType spukiFontType;
  final SpukiFontData? spukiFontData;
  final TextAlign? textAlign;

  const SpukiText(
    this.data, {
    super.key,
    this.textAlign,
    this.spukiFontType = SpukiFontType.regular,
  }) : spukiFontData = null;

  const SpukiText.link(
    this.data, {
    super.key,
    this.textAlign,
    this.spukiFontType = SpukiFontType.link,
  }) : spukiFontData = null;

  const SpukiText.custom(
    this.data, {
    super.key,
    this.textAlign,
    required this.spukiFontData,
  }) : spukiFontType = SpukiFontType.custom;

  const SpukiText.h1(
    this.data, {
    super.key,
    this.textAlign,
  })  : spukiFontType = SpukiFontType.h1,
        spukiFontData = null;

  const SpukiText.h2(
    this.data, {
    super.key,
    this.textAlign,
  })  : spukiFontType = SpukiFontType.h2,
        spukiFontData = null;

  const SpukiText.h3(
    this.data, {
    super.key,
    this.textAlign,
  })  : spukiFontType = SpukiFontType.h3,
        spukiFontData = null;

  @override
  Widget build(BuildContext context) {
    final theme = SpukiTheme.of(context);

    final fontStyle = switch (spukiFontType) {
      SpukiFontType.regular => theme.spukiFont.regular,
      SpukiFontType.link => theme.spukiFont.link,
      SpukiFontType.h1 => theme.spukiFont.h1,
      SpukiFontType.h2 => theme.spukiFont.h2,
      SpukiFontType.h3 => theme.spukiFont.h3,
      SpukiFontType.custom => spukiFontData ?? theme.spukiFont.regular,
    };

    return Text(
      data,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: theme.puk(fontStyle.sizePuk),
        fontWeight: fontStyle.fontWeight,
        color: fontStyle.color,
      ),
    );
  }
}
