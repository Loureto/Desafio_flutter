import '../theme/theme.dart';

extension Responsive on num {
  double get responsiveHeight => SizeConfig.heightMultiplier * this;

  double get responsiveWidth => SizeConfig.widthMultiplier * this;

  double get fontSize => SizeConfig.textMultiplier * this;
}
