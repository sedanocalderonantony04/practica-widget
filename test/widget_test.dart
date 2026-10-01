import 'package:flutter_test/flutter_test.dart';
import 'package:practica_widget/main.dart';

void main() {
  testWidgets('El menú muestra las 5 preguntas', (WidgetTester tester) async {
    await tester.pumpWidget(const TrabajoGrupal());

    expect(find.text('1. ¿Qué es un widget?'), findsOneWidget);
    expect(find.text('5. Widget que permite crear listas'), findsOneWidget);
  });
}
