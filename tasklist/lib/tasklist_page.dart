import 'package:flutter/material.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  List<String> tasks = [];

  final TextEditingController taskController = TextEditingController();

  void _addTask(String value) {
    if (value.isEmpty) {
      return;
    }

    tasks.add(value);
    taskController.clear();
  }

  void _clearTasks() {
    tasks.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 3, right: 3),
                child: Row(
                  children: [
                    Flexible(
                      child: TextField(
                        controller: taskController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Adicione uma task...',
                            hintText: "Ex.: Task FOL-3728"),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                      onPressed: (() {
                        setState(() {
                          _addTask(taskController.text);
                          taskController.clear;
                        });
                      }),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Flexible(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      color: Colors.black45,
                      child: ListTile(
                        title: Text(
                          '${index + 1} - ${tasks[index]}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child:
                        Text('Você possui ${tasks.length} tarefas pendentes'),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  SizedBox(
                    width: 115,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _clearTasks();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                      ),
                      child: const Text('Limpar tudo'),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
