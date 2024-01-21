import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Center(child: HomeActivity()),
    );
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key});

  MySnackBar(message, context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  MyAlertDialog(context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Expanded(
              child: AlertDialog(
            title: const Text('Alert'),
            content: const Text('Do you want to delete?'),
            actions: [
              TextButton(
                  onPressed: () {
                    MySnackBar('Successfully Delete', context);
                    Navigator.of(context).pop();
                  },
                  child: const Text('yes')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('no')),
            ],
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Button'),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: () {
          MyAlertDialog(context);
        },
        child: const Text('click me'),
      )),
    );
  }
}
