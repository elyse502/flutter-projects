import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double _deviceHeight, _deviceWidth;

  String? _newTaskContent;

  _HomePageState();

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    // print("Input Value: $_newTaskContent");
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: _deviceHeight * 0.15,
        title: const Text(
          'Taskly!',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: _taskList(),
      floatingActionButton: _addTaskButton(),
    );
  }

  Widget _taskList() {
    return ListView(
      children: [
        ListTile(
          title: Text(
            "Do Laundry!",
            style: TextStyle(decoration: TextDecoration.lineThrough),
          ),
          subtitle: Text(DateTime.now().toString()),
          trailing: Icon(Icons.check_box_outlined, color: Colors.red),
        ),
      ],
    );
  }

  Widget _addTaskButton() {
    return FloatingActionButton(
      onPressed: _displayTaskPopup,
      // shape: CircleBorder(),
      backgroundColor: Colors.red,
      child: Icon(Icons.add, color: Colors.white),
    );
  }

  void _displayTaskPopup() {
    showDialog(
      context: context,
      builder: (BuildContext _context) {
        return AlertDialog(
          title: Text("Add New Task!"),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          content: TextField(
            onSubmitted: (_value) {},
            onChanged: (_value) {
              setState(() {
                _newTaskContent = _value;
              });
            },
          ),
        );
      },
    );
  }
}
