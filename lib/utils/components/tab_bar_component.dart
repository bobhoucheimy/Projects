import 'package:cater_me_v2/utils/effect/my_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MyTabBar extends HookWidget {
  final TabController controller;
  final List<String> labels;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color activeBackgroundColor;
  final Color activeForegroundColor;
  final double fontSize;

  const MyTabBar({

    required this.controller,
    required this.labels,
     required this.backgroundColor,
     required this.foregroundColor,
  required  this.activeBackgroundColor,
   required this.activeForegroundColor,
  required  this.fontSize,
  })  ;

  @override
  Widget build(BuildContext context) {
    final _ids = useState([1, 0]);
    return AspectRatio(
      aspectRatio: 100 / 18,
      child: ColoredBox(
        color: Theme.of(context).primaryColor,
        child: Stack(
          fit: StackFit.expand,
          children: _ids.value.map((id)  {
            var active = controller.index == id;
            return MyTab(
                backgroundColor: backgroundColor,
                foregroundColor: foregroundColor,
                activeBackgroundColor: activeBackgroundColor,
                activeForegroundColor: activeForegroundColor,
                fontSize: fontSize,
                active: active,
                reversed: id == 1,
                label: labels[id],
                onTap: () {
                  controller.animateTo(id);
                  _ids.value = _ids.value.reversed.toList();
                });
          }).toList(),
        ),
      ),
    );
  }
}