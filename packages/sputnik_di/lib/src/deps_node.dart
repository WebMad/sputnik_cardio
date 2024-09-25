abstract class DepsNode {
  R bind<R>(R Function() creator) {
    final object = creator();

    return object;
  }
}
