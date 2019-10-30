import 'package:rxdart/rxdart.dart';

abstract class ViewModel<E> {
  final PublishSubject<E> _events = PublishSubject<E>();

  Stream<E> get events => _events.stream;

  void publish(E event) {
    _events.add(event);
  }

  void onResume() {}
}
