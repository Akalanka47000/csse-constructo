import 'package:constructo/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Color Functions Test', () {
    test('Color Invert', () {
      final originalColor = Color(0xFF000000); // Green color
      final invertedColor = invert(originalColor);
      expect(invertedColor, equals(Color(0xFFFFFFFF))); // Magenta color
    });

    test('Remove All HTML Tags', () {
      final htmlText = '<p>This is <strong>sample</strong> <em>text</em>.</p>';
      final textWithoutTags = removeAllHtmlTags(htmlText);
      expect(textWithoutTags, equals('This is sample text.'));
    });
  });
}