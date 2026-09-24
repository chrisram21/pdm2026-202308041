import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inkash/app.dart';

void main() {
  testWidgets('Inicio muestra el saldo y los ultimos movimientos', (tester) async {
    await tester.pumpWidget(const ProviderScope(child: InkashApp()));

    // Primer frame: los providers todavia estan resolviendo.
    expect(find.byType(CircularProgressIndicator), findsWidgets);

    await tester.pumpAndSettle();

    expect(find.text('TE QUEDAN DISPONIBLES'), findsOneWidget);
    expect(find.text('Q1,989.13'), findsWidgets);
    expect(find.text('4 activas'), findsOneWidget);

    // Los tres movimientos mas recientes, en el orden del diseno.
    expect(find.text('Uber al trabajo'), findsOneWidget);
    expect(find.text('Super La Torre'), findsOneWidget);
    expect(find.text('Salario quincena'), findsOneWidget);

    // Un movimiento viejo NO deberia aparecer en la seccion de Inicio.
    expect(find.text('Farmacia'), findsNothing);
  });
}
