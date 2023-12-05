import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage(),);
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyAppState();
}

class _MyAppState extends State<HomePage> {
  DateTimeRange time = DateTimeRange(start: DateTime.now(), end: DateTime.now());
  var now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  now.toString()
                ),
                Text(now.day.toString()),
                Text(DateFormat('yyyy/MM/d').format(DateTime(2023,12,5))),
                Text(DateFormat('yyyy/MM/d  H:m').format(DateTime(2023,12,5,12,20))),
                Text(DateFormat('yyyy/MMM').format(DateTime(2023,12))),
                Text(DateFormat('EEEE  H:m:s').format(DateTime(2023,12,12,20,12,35))),
                Text(DateFormat('y/MM/d H:m:s').format(DateTime.parse('2016-25-12 23:50:55'))),
                Text(time.duration.inDays.toString()),
                TextButton(onPressed: ()async{
                  final DateTimeRange? dateTimeRange = await showDateRangePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(3000));
                  if(dateTimeRange!=null){
                    setState(() {
                      time=dateTimeRange;
                    });
                  }
                }, child: const Text('pickTime'))
              ],
            ),
          ),
        ),
    );
  }
}

