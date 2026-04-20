import 'package:desafio_flutter/core/core.dart';
import 'package:flutter/material.dart';

const int kDefaultScalingFactor = 8;

class Dimension {
  /// Extra small = 4
  static const xxs = Dimension(0.5);

  /// Extra small = 8
  static const xs = Dimension(1);

  /// Small = 16
  static const sm = Dimension(2);

  /// Medium = 24
  static const md = Dimension(3);

  /// Large = 32
  static const lg = Dimension(4);

  /// Extra large = 40
  static const xl = Dimension(5);

  /// Extra large = 48
  static const xxl = Dimension(6);

  /// Extra large = 56
  static const xxxl = Dimension(7);

  static double get paddingHorizontal => sm.value;

  static double get _bottomSpacing => sm.value;

  static double bottomPadding(BuildContext context) =>
      _bottomSpacing + MediaQuery.of(context).padding.bottom;

  static double bottomSheetPadding(BuildContext context) =>
      lg.value + MediaQuery.of(context).padding.bottom;

  static SizedBox bottomSpacing(BuildContext context) =>
      SizedBox(height: _bottomSpacing + MediaQuery.of(context).padding.bottom);

  final double _val;

  /// Raw double value, without considering responsiveness.
  double get value => _val * factor;

  /// The scaling factor for gutters and margins
  final int factor;

  /// Default [Dimension] constructor
  const Dimension(this._val, {this.factor = kDefaultScalingFactor});

  /// Binary subtraction operator.
  Dimension operator -(Dimension other) => Dimension(value - other.value);

  /// Binary addition operator.
  Dimension operator +(Dimension other) => Dimension(value + other.value);

  /// Multiplication operator.
  Dimension operator *(double operand) => Dimension(value * operand);
}

extension DimensionExtensions on Dimension {
  double get width => value;

  double get height => value.responsiveHeight;

  SizedBox get vertical => SizedBox(height: value.responsiveHeight);

  SizedBox get horizontal => SizedBox(width: value.responsiveWidth);
}
