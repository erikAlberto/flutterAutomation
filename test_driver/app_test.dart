import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('My first group of tests', () {

    final counterText = find.byValueKey('counter');
    final incrementButton = find.byTooltip('Increment');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Should start with counter 0', () async {
      expect(await driver.getText(counterText), "0");
    });

    test('Should increase counter by 1', () async {
      await driver.tap(incrementButton);
      expect(await driver.getText(counterText), "1");
    });

    test('verify the text on home screen', () async {
      SerializableFinder message = find.text("You have pushed the button this many times:");
      await driver.waitFor(message);
      expect(await driver.getText(message), "You have pushed the button this many times:");
    });

  });
}