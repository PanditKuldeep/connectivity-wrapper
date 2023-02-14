library easy_internet_checker;

import 'package:easy_internet_checker/enum/connectivity_status.dart';
import 'package:easy_internet_checker/service/connectivity_service.dart';
import 'package:easy_internet_checker/widget/offline_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConnectivityWrapper extends StatelessWidget {
  /// The [child] contained by the ConnectivityWidgetWrapper.
  final Widget child;

  /// The [offlineWidget] contained by the ConnectivityWidgetWrapper.
  //final Widget? offlineWidget;

  /// The decoration to paint behind the [child].
  //final Decoration? decoration;

  /// The color to paint behind the [child].
  // final Color? color;

  /// If non-null, the style to use for this text.
  //final TextStyle? messageStyle;

  /// widget height.
  //final double? height;

  /// Disable the user interaction with child widget
  final bool disableInteraction;

  /// How to align the offline widget.
  //final AlignmentGeometry? alignment;

  ///
  ///
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

  const ConnectivityWrapper(
      {Key? key,
      required this.child,
      this.disableInteraction = false,
      this.offlineWidgetColor,
      this.offlineWidgetMessageStyle,
      this.offlineMessage,
      this.offlineWidgetTextAlign,
      this.offlineWidgetHeight,
      this.offlineWidgetTextPadding,
      this.containerAlignment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamProvider<ConnectivityStatus>.value(
      value: ConnectivityService().connectionStatusController.stream,
      initialData: ConnectivityStatus.wifi,
      child: Consumer<ConnectivityStatus>(
        builder: (context, value, _) {
          final bool isOffline = value == ConnectivityStatus.offline;
          return disableInteraction || isOffline
              ? Stack(
                  children: <Widget>[
                    SafeArea(
                      child: child,
                    ),
                    disableInteraction && isOffline
                        ? Column(
                            children: <Widget>[
                              Flexible(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.black38,
                                  ),
                                ),
                              )
                            ],
                          )
                        : Container(),
                    disableInteraction && isOffline
                        ? OfflineWidget(
                            offlineMessage: offlineMessage,
                            offlineWidgetColor: offlineWidgetColor,
                            offlineWidgetHeight: offlineWidgetHeight,
                            offlineWidgetMessageStyle:
                                offlineWidgetMessageStyle,
                            offlineWidgetTextAlign: offlineWidgetTextAlign,
                            offlineWidgetTextPadding: offlineWidgetTextPadding,
                            containerAlignment: containerAlignment,
                          )
                        : Container(),
                  ],
                )
              : Container();
        },
      ),
    );
  }
}
