import 'package:flutter/material.dart';

class WidgetSizemEnums extends StatelessWidget {
  const WidgetSizemEnums({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Card(
        child: Container(
          color: Colors.green,
          height: WidgetSize.normalHeightCard.value(),
        ),
      ),
    );
  }
}

enum WidgetSize { normalHeightCard, circleProfileWidth }

extension WidgetSizeExtension on WidgetSize {
  double value() {
    switch (this) {
      case WidgetSize.normalHeightCard:
        return 30;
      case WidgetSize.circleProfileWidth:
        return 25;
    }
  }
}
