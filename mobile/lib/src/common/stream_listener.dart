import 'dart:async';

import 'package:flutter/material.dart';

class StreamListener<T> extends StatefulWidget {
  final Stream<T> stream;
  final Widget? child;
  final void Function(T data) listener;

  const StreamListener({
    super.key,
    required this.stream,
    this.child,
    required this.listener,
  });

  @override
  State<StreamListener<T>> createState() => _StreamListenerState();
}

class _StreamListenerState<T> extends State<StreamListener<T>> {
  StreamSubscription<T>? sub;

  @override
  void initState() {
    super.initState();

    sub = widget.stream.listen((event) => widget.listener(event));
  }

  @override
  void dispose() {
    sub?.cancel();
    sub = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox.shrink();
  }
}
