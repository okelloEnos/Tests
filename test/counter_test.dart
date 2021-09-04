import 'package:test/test.dart';
import 'package:test_practice/counter.dart';

void main (){

  group('Counter', (){

    test('Initial Counter', (){
      expect(Counter().value, 0);
    });

    test('Counter Value should be incremented.', (){
      final counter = Counter();

      counter.increment();

      expect(counter.value, 1);
    });

    test('Counter Value should be decremented.', (){
      final counter = Counter();

      counter.decrement();

      expect(counter.value, -1);
    });
  });
}