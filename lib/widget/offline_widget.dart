import 'package:easy_internet_checker/utils/string_constant.dart';
import 'package:flutter/material.dart';

class OfflineWidget extends StatelessWidget {
  /// The color to paint behind the [child].
  final Color? offlineWidgetColor;

  /// Disconnected message.
  final String? offlineMessage;

  /// If non-null, the style to use for this text.
  final TextStyle? offlineWidgetMessageStyle;

  /// widget height.
  final double? offlineWidgetHeight;

  /// message text align.
  final TextAlign? offlineWidgetTextAlign;

  /// message text padding.
  final EdgeInsetsGeometry? offlineWidgetTextPadding;

  final AlignmentGeometry? containerAlignment;

  const OfflineWidget(
      {super.key,
      this.offlineWidgetHeight,
      this.offlineWidgetColor,
      this.offlineMessage,
      this.offlineWidgetTextAlign,
      this.offlineWidgetTextPadding,
      this.offlineWidgetMessageStyle,
      this.containerAlignment});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: containerAlignment ?? Alignment.topCenter,
      child: Container(
        decoration: BoxDecoration(
          color: offlineWidgetColor ?? Colors.red,
        ),
        height: offlineWidgetHeight == null
            ? 150.00
            : offlineWidgetHeight! < 120
                ? 150
                : offlineWidgetHeight,
        child: Center(
          child: Padding(
            padding: offlineWidgetTextPadding ?? const EdgeInsets.all(16.0),
            child: Text(
              offlineMessage ?? StringConst.noInternetConn,
              textAlign: offlineWidgetTextAlign ?? TextAlign.center,
              style: offlineWidgetMessageStyle ??
                  Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ),
      ),
    );
  }
}
