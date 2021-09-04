import 'package:flutter_test/flutter_test.dart';
import 'package:test_practice/widget.dart';

void main(){
  
  testWidgets('My Widget has title and Message', (WidgetTester tester) async{

    // Test code goes here.
    // Create the widget by telling the tester to build it.
    await tester.pumpWidget(const MyWidget(title: 'T', message: 'M'));

    // Create the Finders.
    final titleFinder = find.text('T');
    final messageFinder = find.text('M');

    // Use the `findsOneWidget` matcher provided by flutter_test to verify
    // that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });
}