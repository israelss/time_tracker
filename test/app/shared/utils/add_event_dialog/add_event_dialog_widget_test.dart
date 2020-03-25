import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:time_tracker/app/shared/utils/add_event_dialog/add_event_dialog_widget.dart';

main() {
  testWidgets('AddEventDialogWidget has message', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(AddEventDialogWidget()));
    final textFinder = find.text('AddEventDialog');
    expect(textFinder, findsOneWidget);
  });
}
