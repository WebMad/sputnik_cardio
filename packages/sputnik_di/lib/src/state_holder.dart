import 'dart:async';

import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'lifecycle/disposable.dart';

abstract class StateHolder<T> implements Disposable {
  final _streamController = StreamController<T>.broadcast();

  T _state;

  StateHolder(this._state);

  T get state => _state;

  @protected
  set state(T newState) {
    _state = newState;
    _streamController.add(newState);
  }

  Stream<T> get stream => _streamController.stream;

  Stream<T> get asStream => _streamController.stream.startWith(state);

  @override
  @mustCallSuper
  FutureOr<void> dispose() async {
    await _streamController.close();
  }
}
