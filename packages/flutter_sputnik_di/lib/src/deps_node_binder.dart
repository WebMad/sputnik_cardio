import 'package:flutter/widgets.dart';
import 'package:sputnik_di/sputnik_di.dart';

class _DepsNodeBinderInh<T extends DepsNode> extends InheritedWidget {
  final T depsNode;

  const _DepsNodeBinderInh({
    super.key,
    required this.depsNode,
    required super.child,
  });

  static R of<R extends DepsNode>(BuildContext context, {bool listen = false}) {
    final result = listen
        ? context.dependOnInheritedWidgetOfExactType<_DepsNodeBinderInh<R>>()
        : context.findAncestorWidgetOfExactType<_DepsNodeBinderInh<R>>();

    assert(result != null, 'No DepsNodeBinder found in context');
    return result!.depsNode;
  }

  @override
  bool updateShouldNotify(_DepsNodeBinderInh old) => old.depsNode != depsNode;
}

class DepsNodeBinder<T extends DepsNode> extends StatefulWidget {
  final T Function() depsNode;
  final Widget child;
  final bool bindToTree;

  const DepsNodeBinder._({
    super.key,
    required this.child,
    required this.depsNode,
    this.bindToTree = true,
  });

  factory DepsNodeBinder({
    Key? key,
    required T Function() depsNode,
    required Widget child,
  }) =>
      DepsNodeBinder<T>._(
        child: child,
        key: key,
        depsNode: depsNode,
        bindToTree: true,
      );

  factory DepsNodeBinder.value({
    Key? key,
    required T depsNode,
    required Widget child,
  }) =>
      DepsNodeBinder<T>._(
        key: key,
        depsNode: () => depsNode,
        child: child,
        bindToTree: false,
      );

  static R of<R extends DepsNode>(
    BuildContext context, {
    bool listen = false,
  }) =>
      _DepsNodeBinderInh.of<R>(context, listen: listen);

  @override
  State<DepsNodeBinder<T>> createState() => _DepsNodeBinderState<T>();
}

class _DepsNodeBinderState<T extends DepsNode>
    extends State<DepsNodeBinder<T>> {
  late final T depsNode;

  @override
  void initState() {
    super.initState();

    depsNode = widget.depsNode();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _DepsNodeBinderInh<T>(
      depsNode: depsNode,
      child: widget.child,
    );
  }
}

extension DepsNodeBuildContextEx on BuildContext {
  R depsNode<R extends DepsNode>({bool listen = false}) =>
      DepsNodeBinder.of<R>(this, listen: listen);
}
