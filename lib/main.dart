import 'package:flutter/material.dart';

Duration milliDuration = new Duration(milliseconds: 6);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timer',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyTimer(title: 'Flutter_Beginner_Timer'),
    );
  }
}

class MyTimer extends StatefulWidget {
  const MyTimer({super.key, required this.title});

  final String title;

  @override
  State<MyTimer> createState() => _MyTimerState();
}

class _MyTimerState extends State<MyTimer> {
  int _minute = 0;
  int _second = 00;
  int _milliSecond = 00;
  bool _isTimer = false;

  void _timerStart()
  {
    _minute = 0;
    _second = 0;
    _milliSecond = 0;
    _isTimer = true;
    _timer();
  }
  void _timerContinue()
  {
    _isTimer = true;
    _timer();
  }
  void _timerFin()
  {
    _isTimer = false;
  }

  void _timer() async
  {
    while(_isTimer)
      {
        _timerClock();
        await Future.delayed(milliDuration);
      }
  }

  void _timerClock()
  {
    setState(()
    {
      ++_milliSecond;
      if(_milliSecond == 100)
        {
          _milliSecond = 00;
          ++_second;
        }
      if(_second == 60)
        {
          _second = 00;
          ++_minute;
        }
    });
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Timer',
              style: TextStyle(
                fontSize: 25
              ),
            ),
            Text(
              '$_minute : ${_second.toString().padLeft(2,'0')} : ${_milliSecond.toString().padLeft(2,'0')}',
              style: TextStyle(
                fontSize: 50
              ),
            ),
            TextButton(
                onPressed: _timerStart,
                child: const Text('Start'),
            ),
            TextButton(
                onPressed: _timerContinue,
                child: const Text('Restart')
            ),

            TextButton(
                onPressed: _timerFin,
                child: const Text('Stop')
            ),
          ],
        ),
      ),
      );
  }
}
