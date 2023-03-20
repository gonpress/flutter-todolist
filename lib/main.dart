import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TodoList(),
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  TextEditingController todoItem = TextEditingController();
  var todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
          backgroundColor: Colors.blueGrey[700],
        ),
        body: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: IconButton(
                          icon: Icon(Icons.arrow_circle_left_sharp, size: 40.0),
                          onPressed: () {}),
                    ),
                    Expanded(
                      child: Text(DateTime.now().toString().substring(0, 10),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400)),
                    ),
                    Expanded(
                      child: IconButton(
                          icon:
                              Icon(Icons.arrow_circle_right_sharp, size: 40.0),
                          onPressed: () {}),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: SizedBox(
                        height: 50,
                        child: TextField(
                          controller: todoItem,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: '할 일을 입력하세요',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                        flex: 1,
                        child: ElevatedButton(
                          onPressed: () {
                            todoList.add(todoItem.text);
                            print('todoList: $todoList');
                          },
                          child: Text('추가', style: TextStyle(fontSize: 16)),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey[700],
                            minimumSize: const Size(60, 50),
                          ),
                        )),
                  ],
                ),
              ),
              Divider(
                height: 10,
                thickness: 1,
                color: Colors.grey,
              ),
              Expanded(
                child: ListView(
                  children: todoList.map((todo) {
                    return ListTile(
                      title: Text(todo),
                      trailing: IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            todoList.removeAt(todoList.indexOf(todo));
                            print('todoList: $todoList');
                          }),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: SizedBox(
          child: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(onPressed: () {}, child: Text('전체')),
                TextButton(onPressed: () {}, child: Text('진행 중')),
                TextButton(onPressed: () {}, child: Text('완료')),
                TextButton(onPressed: () {}, child: Text('전체 삭제')),
              ],
            ),
          ),
        ));
  }
}
