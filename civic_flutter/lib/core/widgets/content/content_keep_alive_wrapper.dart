import 'package:flutter/material.dart';

class ContentKeepAliveWrapper extends StatefulWidget {
  final Widget child;

  const ContentKeepAliveWrapper({
    super.key,
    required this.child,
  });

  @override
  State<ContentKeepAliveWrapper> createState() => _ContentKeepAliveWrapperState();
}

class _ContentKeepAliveWrapperState extends State<ContentKeepAliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}
