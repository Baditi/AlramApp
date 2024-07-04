import 'package:alramclockfinal/clock_view.dart';
import 'package:alramclockfinal/data.dart';
import 'package:alramclockfinal/enums.dart';
import 'package:alramclockfinal/menu_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'alarm_page.dart';
import 'clock_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    var formattedTime = DateFormat('HH:mm').format(now);
    var formattedDate = DateFormat('EEE, d MMM').format(now);
    var timezoneString = now.timeZoneOffset
        .toString()
        .split('.')
        .first;
    var offsetSign = '';
    if (!timezoneString.startsWith('-')) offsetSign = '+';
    print(timezoneString);


    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
      body: Row(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: menuItems.map((currentMenuInfo)=>buildMenuButton(currentMenuInfo))
                .toList(),
          ),
          VerticalDivider(color: Colors.white, width: 1,),
          Expanded(
            child: Consumer<MenuInfo>(
              //builder: (BuildContext context,MenuInfo value,Widget child){},
              builder: (BuildContext context, MenuInfo value, Widget? child) {
                if(value.menuType !=MenuType.clock)
                  return ClockPage();
                else if(value.menuType==MenuType.alram)
                  return AlramPage();
                else
                return  Container(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Text('Clock', style: TextStyle(
                            color: Colors.white, fontSize: 24),
                        ),
                      ),

                      Flexible(
                        flex: 2,

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(formattedTime, style: TextStyle(
                                color: Colors.white, fontSize: 64),
                            ),
                            Text(formattedDate, style: TextStyle(
                                color: Colors.white, fontSize: 20),
                            ),
                          ],
                        ),
                      ),

                      Flexible(
                          flex: 4,
                          fit: FlexFit.tight,
                          child: Align(
                              alignment: Alignment.center,
                              child: ClockView(size: MediaQuery
                                  .of(context)
                                  .size
                                  .height / 4,))
                      ),
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Timezone', style: TextStyle(
                                color: Colors.white, fontSize: 25),
                            ),
                            SizedBox(height: 16),
                            Row(
                              children: <Widget>[
                                Icon(Icons.language, color: Colors.white
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  'UTC' + offsetSign + timezoneString,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }


  Widget buildMenuButton(MenuInfo currentMenuInfo) {
    return Consumer<MenuInfo>(
      builder: (BuildContext context, MenuInfo value, Widget? child) {
        return  TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 0),
            backgroundColor: currentMenuInfo.menuType == value.menuType ? Colors.grey: Colors.transparent,
          ),
          onPressed: () {
            var menuInfo=Provider.of<MenuInfo>(context,listen: false);
            menuInfo.updateMenu(currentMenuInfo);

          },
          child: Column(
            children: <Widget>[
              Image.asset(currentMenuInfo.imageSource, scale: 1.5),
              SizedBox(height: 16),
              Text(
                currentMenuInfo.title ?? '',
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ],
          ),
        );
      },

    );
  }
}