import 'package:flutter/widgets.dart';
import 'package:rxdart/rxdart.dart';

abstract class ReactiveRepository<D> {
  final Subject<D> _data = BehaviorSubject();

  Stream<D> get data => _data.stream;

  @protected
  Future<D> fetch();

  Future<D> update() {
    return fetch().then((data) {
      _data.add(data);
      return data;
    }).catchError((Object error, StackTrace stack) {
      debugPrint(stack.toString());
      _data.add(null);
    });
  }
}
