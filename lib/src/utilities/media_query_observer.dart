import 'package:flutter/widgets.dart';

/// Observes the window changes and provides a [MediaQuery]
/// always up to date.
class MediaQueryObserver extends StatefulWidget {
  final Widget child;

  const MediaQueryObserver({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  MediaQueryObserverState createState() => MediaQueryObserverState();
}

class MediaQueryObserverState extends State<MediaQueryObserver>
    with WidgetsBindingObserver {
  @override
  void didChangeMetrics() {
    setState(() {});
    super.didChangeMetrics();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.implicitView!),
      child: widget.child,
    );
  }
}
