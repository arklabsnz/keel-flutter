import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

abstract class ReactiveListRepository<D> {
  final Subject<List<D>?> _data = BehaviorSubject();

  Stream<List<D>?> get data => _data.stream;

  Stream<int> get count => _data.map((data) => data?.length ?? 0);

  @protected
  Future<List<D>?> fetch();

  Future<void> update() {
    return fetch().then(_data.add).catchError((Object error, StackTrace stack) {
      debugPrint(stack.toString());
      _data.add(null);
    });
  }
}
