import 'package:flutter/material.dart';

import '../../../utils/sizes.dart';

class DropDownLoadingIndicator extends StatelessWidget {
  const DropDownLoadingIndicator({
    super.key,
    this.loadingIndicatorProps = const LoadingIndicatorProps(),
  });

  final LoadingIndicatorProps loadingIndicatorProps;

  @override
  Widget build(BuildContext context) {
    return loadingIndicatorProps.showLoadingText
        ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLoadingIndicator(),
                const SizedBox(
                  height: AppSizes.s8,
                ),
                Text(
                  loadingIndicatorProps.loadingText ?? 'loading...',
                  style: loadingIndicatorProps.loadingStyle,
                ),
              ],
            ),
          )
        : _buildLoadingIndicator();
  }

  Widget _buildLoadingIndicator() =>
      loadingIndicatorProps.loadingWidget ??
      const CircularProgressIndicator.adaptive();
}

class LoadingIndicatorProps {
  const LoadingIndicatorProps({
    this.loadingText,
    this.showLoadingText = true,
    this.loadingStyle,
    this.loadingWidget,
  });
  final String? loadingText;
  final bool showLoadingText;
  final TextStyle? loadingStyle;
  final Widget? loadingWidget;
}
