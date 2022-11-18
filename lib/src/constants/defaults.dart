import 'package:flutter/material.dart';

import '../../formatted_text.dart';

mixin FormattedTextDefaults {
  static const List<FormattedTextToolbarAction>
      formattedTextToolbarDefaultActions = [
    FormattedTextToolbarAction(
      patternChars: '*',
      label: 'Bold',
    ),
    FormattedTextToolbarAction(
      patternChars: '_',
      label: 'Italic',
    ),
    FormattedTextToolbarAction(
      patternChars: '~',
      label: 'Strikethrough',
    ),
    FormattedTextToolbarAction(
      patternChars: '|',
      label: 'Spoiler',
    ),
  ];

  static List<FormattedTextFormatter> formattedTextDefaultFormatters = [
    const FormattedTextFormatter(
      patternChars: '*',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    const FormattedTextFormatter(
      patternChars: '_',
      style: TextStyle(fontStyle: FontStyle.italic),
    ),
    const FormattedTextFormatter(
      patternChars: '~',
      style: TextStyle(decoration: TextDecoration.lineThrough),
    ),
    const FormattedTextFormatter(
      patternChars: '|',
      style: TextStyle(
          // backgroundColor: Colors.grey.withOpacity(0.4),
          // background: Paint()
          //   ..color = Colors.grey.withOpacity(0.5)
          //   ..strokeWidth = 10
          //   ..strokeJoin = StrokeJoin.round
          //   ..style = PaintingStyle.stroke
          ),
    ),
  ];
}
