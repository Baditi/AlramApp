import 'package:alramclockfinal/enums.dart';
import 'package:alramclockfinal/menu_info.dart';

import 'alarm_info.dart';

List<MenuInfo> menuItems=[
  MenuInfo(MenuType.clock,
      title: 'Clock',
      imageSource: 'assests/clock_icon.png'),
  MenuInfo(MenuType.alram,
      title: 'Alram',
      imageSource: 'assests/alram_icon.png'),
  MenuInfo(MenuType.timer,
      title: 'Timer',
      imageSource: 'assests/timer_icon.png'),
  MenuInfo(MenuType.stopwatch,
      title: 'Stopwatch',
      imageSource: 'assests/stopwatch_icon.png')
];
List<AlarmInfo> alarms = [
  AlarmInfo(alarmDateTime: DateTime.now().add(Duration(hours: 1)), title: 'Office', gradientColorIndex: 0),
  AlarmInfo(alarmDateTime: DateTime.now().add(Duration(hours: 2)), title: 'Sport', gradientColorIndex: 1),
];