import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskly/models/task.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late double _deviceHeight, _deviceWidth;

  String? _newTaskContent;

  _HomePageState();

  Box? _box;

  @override
  void initState() {
    super.initState();
  }

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
      body: _taskView(),
      floatingActionButton: _addTaskButton(),
    );
  }

  Widget _taskView() {
    return FutureBuilder(
      // future: Future.delayed(Duration(seconds: 2)),
      future: Hive.openBox("tasks"),
      builder: (BuildContext _context, AsyncSnapshot _snapshot) {
        if (_snapshot.connectionState == ConnectionState.done) {
          _box = _snapshot.data;
          return _taskList();
        } else {
          return Center(child: CircularProgressIndicator(color: Colors.red));
        }
      },
    );
  }

  Widget _taskList() {
    // Add a new task to the box (hive database)
    /*Task _newTask = Task(
      content: "Go To Gym!",
      timestamp: DateTime.now(),
      done: false,
    );
    _box?.add(_newTask.toMap());*/
    List tasks = _box!.values.toList();
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (BuildContext _context, int _index) {
        var task = Task.fromMap(tasks[_index]);
        return ListTile(
          title: Text(
            task.content,
            style: TextStyle(
              decoration: task.done ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(task.timestamp.toString()),
          trailing: Icon(
            task.done
                ? Icons.check_box_outlined
                : Icons.check_box_outline_blank_outlined,
            color: Colors.red,
          ),
        );
      },
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
            decoration: InputDecoration(
              // Red underline styling
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red), // Default state
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red), // When focused
              ),
            ),
            cursorColor: Colors.red,

            onSubmitted: (_) {
              if (_newTaskContent != null) {
                var _task = Task(
                  content: _newTaskContent!,
                  timestamp: DateTime.now(),
                  done: false,
                );
                _box!.add(_task.toMap());
                setState(() {
                  _newTaskContent = null;
                  Navigator.pop(context);
                });
              }
            },
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
