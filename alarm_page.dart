import 'package:alramclockfinal/data.dart';
import 'package:alramclockfinal/theme_data.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AlramPage extends StatefulWidget {
  const AlramPage({super.key});

  @override
  State<AlramPage> createState() => _AlramPageState();
}

class _AlramPageState extends State<AlramPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 32,vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: <Widget>[
          Text('Alarm',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: CustomColors.primaryTextColor,
            fontSize: 24,
          ),
          ),
          Expanded(
            child: ListView(
              children: alarms.map<Widget>((alarm) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 32),
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                 // height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.purple,Colors.red],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.red.withOpacity(0.4),
                        blurRadius: 8,
                        spreadRadius: 2,
                        offset: Offset(4,4),
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(24))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.label,color: Colors.white,size: 24,
                              ),
                              SizedBox(width: 8,),
                              Text('office',style: TextStyle(
                                color: Colors.white,
                              ),),
                            ],
                          ),

                          Switch( onChanged: (bool value){},
                            value: true,
                            activeColor: Colors.white,
                          ),
                        ],
                      ),
                      Text('Mon-Fri',style: TextStyle(
                        color: Colors.white,
                      ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('07:00AM',style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 24
                          ),),
                          Icon(Icons.keyboard_arrow_down,color: Colors.white,size:36)
                        ],
                      ),
                    ],
                  ),
                );
              }).followedBy([
                DottedBorder(
                  strokeWidth: 3,
                  color: CustomColors.clockBG,
                  borderType: BorderType.RRect,
                  radius: Radius.circular(24),
                  dashPattern: [5,4],
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                    color: CustomColors.clockBG,
                    borderRadius: BorderRadius.all(Radius.circular(24))),
                    //height: 100,

                    child: TextButton(
                      //padding:const EdgeInsets.symmetric(horizontal: 32,vertical: 16),
                      onPressed: (){},
                      child: Column(
                        children: [
                          Image.asset('assests/add_alarm.png',scale: 1.5,
                          ),
                          SizedBox(height: 8,),
                          Text('Add Alarm',style: TextStyle(color: Colors.white),
                          )
                      
                        ],
                      ),
                    ),
                  ),
                ),
              ]).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
