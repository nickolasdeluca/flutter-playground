import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:tasklist/models/task.dart';

class TaskListPage extends StatefulWidget {
  const TaskListPage({Key? key}) : super(key: key);

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  List<Task> tasks = [];

  final TextEditingController taskController = TextEditingController();

  final formatter = DateFormat('dd-MM-yyyy hh:mm');

  void _addTask(String value) {
    if (value.isEmpty) {
      return;
    }

    tasks.add(
      Task(
        title: value,
        date: DateTime.now(),
      ),
    );

    taskController.clear();
  }

  void _clearTasks() {
    if (tasks.isEmpty) {
      return;
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Limpar tudo?'),
        content: const Text('Esta opção é irreversível!'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                tasks.clear();
              });

              Navigator.pop(context);
            },
            child: const Text(
              'Sim',
              style: TextStyle(
                color: Colors.red,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'Não',
              style: TextStyle(
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _removeTaskAtIndex(int index) {
    Task deletedTask = tasks[index];

    setState(() {
      tasks.removeAt(index);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Tarefa ${deletedTask.title} foi excluída!'),
        action: SnackBarAction(
          label: 'Desfazer',
          textColor: Colors.white,
          onPressed: () {
            setState(() {
              tasks.insert(index, deletedTask);
            });
          },
        ),
      ),
    );
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
                      width: 5,
                    ),
                    SizedBox(
                      height: 58,
                      width: 58,
                      child: ElevatedButton(
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
                    return Slidable(
                      actions: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 4,
                            bottom: 4,
                            right: 4,
                          ),
                          child: IconSlideAction(
                            color: Colors.green,
                            icon: Icons.share,
                            caption: 'Compartilhar',
                            onTap: () {},
                          ),
                        ),
                      ],
                      actionPane: const SlidableDrawerActionPane(),
                      secondaryActions: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 4,
                            bottom: 4,
                            right: 4,
                          ),
                          child: IconSlideAction(
                            color: Colors.blue,
                            icon: Icons.edit,
                            caption: 'Editar',
                            onTap: () {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 4,
                            bottom: 4,
                            right: 4,
                          ),
                          child: IconSlideAction(
                            color: Colors.red,
                            icon: Icons.delete,
                            caption: 'Delete',
                            onTap: () {
                              _removeTaskAtIndex(index);
                            },
                          ),
                        ),
                      ],
                      child: Card(
                        color: Colors.black45,
                        child: ListTile(
                          title: Text(
                            'Task: ${index + 1} - ${tasks[index].title}',
                            style: const TextStyle(color: Colors.white),
                          ),
                          subtitle: Text(
                            'Data: ${formatter.format(tasks[index].date)} ',
                            style: const TextStyle(color: Colors.white),
                          ),
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
                    width: 120,
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
