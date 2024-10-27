import 'dart:ui';

import 'package:flutter/material.dart';

class SpukiThemeData {
  final SpukiFontThemeData spukiFont;
  final Color scaffoldBackgroundColor;

  const SpukiThemeData.light({
    this.spukiFont = const LightSpukiFontThemeData(),
    this.scaffoldBackgroundColor = Colors.white,
  });

  const SpukiThemeData.dark({
    this.spukiFont = const DarkSpukiFontThemeData(),
    this.scaffoldBackgroundColor = Colors.black,
  });

  double get pukModule => 4;

  double puk(double puk) => puk * pukModule;
}

class LightSpukiFontThemeData extends SpukiFontThemeData {
  const LightSpukiFontThemeData();

  @override
  SpukiFontData get regular => const SpukiFontData(
        sizePuk: 3.5,
        fontWeight: null,
        spukiFontType: SpukiFontType.regular,
        color: Colors.black,
      );

  @override
  SpukiFontData get link => const SpukiFontData(
        sizePuk: 3.5,
        fontWeight: null,
        spukiFontType: SpukiFontType.link,
        color: Colors.grey,
      );

  @override
  SpukiFontData get h1 => const SpukiFontData(
        sizePuk: 12,
        fontWeight: FontWeight.bold,
        spukiFontType: SpukiFontType.h1,
        color: Colors.black,
      );

  @override
  SpukiFontData get h2 => const SpukiFontData(
        sizePuk: 9,
        fontWeight: FontWeight.bold,
        spukiFontType: SpukiFontType.h2,
        color: Colors.black,
      );

  @override
  SpukiFontData get h3 => const SpukiFontData(
        sizePuk: 6,
        fontWeight: FontWeight.bold,
        spukiFontType: SpukiFontType.h3,
        color: Colors.black,
      );
}

class DarkSpukiFontThemeData extends SpukiFontThemeData {
  const DarkSpukiFontThemeData();

  @override
  SpukiFontData get regular => const SpukiFontData(
        sizePuk: 3.5,
        fontWeight: FontWeight.bold,
        spukiFontType: SpukiFontType.regular,
        color: Colors.grey,
      );

  @override
  SpukiFontData get link => const SpukiFontData(
        sizePuk: 3.5,
        fontWeight: null,
        spukiFontType: SpukiFontType.link,
        color: Colors.grey,
      );

  @override
  SpukiFontData get h1 => const SpukiFontData(
        sizePuk: 12,
        fontWeight: FontWeight.bold,
        spukiFontType: SpukiFontType.h1,
        color: Colors.grey,
      );

  @override
  SpukiFontData get h2 => const SpukiFontData(
        sizePuk: 9,
        fontWeight: FontWeight.bold,
        spukiFontType: SpukiFontType.h2,
        color: Colors.grey,
      );

  @override
  SpukiFontData get h3 => const SpukiFontData(
        sizePuk: 6,
        fontWeight: FontWeight.bold,
        spukiFontType: SpukiFontType.h3,
        color: Colors.grey,
      );
}

abstract class SpukiFontThemeData {
  const SpukiFontThemeData();

  SpukiFontData get regular;

  SpukiFontData get link;

  SpukiFontData get h1;

  SpukiFontData get h2;

  SpukiFontData get h3;
}

class SpukiFontData {
  final double sizePuk;
  final FontWeight? fontWeight;
  final SpukiFontType spukiFontType;
  final Color color;

  const SpukiFontData({
    required this.sizePuk,
    required this.fontWeight,
    required this.spukiFontType,
    required this.color,
  });

  SpukiFontData copyWith({
    double? sizePuk,
    FontWeight? fontWeight,
    SpukiFontType? spukiFontType,
    Color? color,
  }) {
    return SpukiFontData(
      sizePuk: sizePuk ?? this.sizePuk,
      fontWeight: fontWeight ?? this.fontWeight,
      spukiFontType: spukiFontType ?? this.spukiFontType,
      color: color ?? this.color,
    );
  }
}

class SpukiTheme extends InheritedWidget {
  final SpukiThemeData spukiThemeData;

  const SpukiTheme({
    super.key,
    required Widget child,
    required this.spukiThemeData,
  }) : super(child: child);

  static SpukiThemeData of(BuildContext context) {
    final SpukiTheme? result =
        context.dependOnInheritedWidgetOfExactType<SpukiTheme>();
    assert(result != null, 'No SpukiTheme found in context');
    return result!.spukiThemeData;
  }

  @override
  bool updateShouldNotify(SpukiTheme old) =>
      old.spukiThemeData != spukiThemeData;
}

enum SpukiFontType {
  custom,
  regular,
  link,
  h1,
  h2,
  h3,
}
