extension IterableExt on Iterable {
  /// Return immutable list
  List<T> toImmutable<T>() => List.unmodifiable(this);
}
