// This is a basic Flutter widget test for the Responsive Pet App.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:my_app/main.dart'; // Ensure this path matches your project structure

void main() {
  // Test to ensure the main app builds and displays core elements
  testWidgets('Pet app displays main elements on small screen', (WidgetTester tester) async {
    // Set a small screen size for the test
    tester.binding.window.physicalSizeTestValue = const Size(360, 640);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the AppBar title is present
    expect(find.text('Adopt a Pet'), findsOneWidget);

    // Verify that the "Featured Pet of the Day" section is present
    expect(find.text('Featured Pet of the Day'), findsOneWidget);
    expect(find.text('Meet Buddy!'), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget); // Checks for the Adopt Buddy button
    expect(find.text('Adopt Buddy'), findsOneWidget);

    // Verify that the "Available Pets" section is present
    expect(find.text('Available Pets'), findsOneWidget);

    // Verify that some pet cards are displayed (e.g., Whiskers and Rocky)
    expect(find.text('Whiskers'), findsOneWidget);
    expect(find.text('Cat'), findsOneWidget);
    expect(find.text('Rocky'), findsOneWidget);
    expect(find.text('Dog'), findsAtLeastNWidgets(2)); // Two dogs in the list

    // Reset screen size after test
    addTearDown(() {
      tester.binding.window.clearPhysicalSizeTestValue();
      tester.binding.window.clearDevicePixelRatioTestValue();
    });
  });

  // Test to ensure the main app displays core elements on large screen (responsive layout)
  testWidgets('Pet app displays main elements on large screen', (WidgetTester tester) async {
    // Set a large screen size for the test
    tester.binding.window.physicalSizeTestValue = const Size(1024, 768);
    tester.binding.window.devicePixelRatioTestValue = 1.0;

    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the AppBar title is present
    expect(find.text('Adopt a Pet'), findsOneWidget);

    // Verify that the "Featured Pet of the Day" section is present
    expect(find.text('Featured Pet of the Day'), findsOneWidget);
    expect(find.text('Meet Buddy!'), findsOneWidget);
    expect(find.text('Adopt Buddy'), findsOneWidget);

    // Verify that the "Available Pets" section is present
    expect(find.text('Available Pets'), findsOneWidget);

    // Verify that some pet cards are displayed
    expect(find.text('Whiskers'), findsOneWidget);
    expect(find.text('Rocky'), findsOneWidget);

    // Additionally, you can try to verify the layout change (e.g., Row vs Column)
    // This is more advanced and might require inspecting the widget tree structure.
    // For now, we'll rely on the presence of key widgets.

    // Reset screen size after test
    addTearDown(() {
      tester.binding.window.clearPhysicalSizeTestValue();
      tester.binding.window.clearDevicePixelRatioTestValue();
    });
  });
}