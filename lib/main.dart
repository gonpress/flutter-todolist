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
                      // TODO: 왼쪽 화살표를 누르면 이전 날짜로 넘어가도록 한다.
                      child: IconButton(
                          icon: Icon(Icons.arrow_circle_left_sharp, size: 40.0),
                          onPressed: () {}),
                    ),
                    Expanded(
                      // TODO: 날짜를 누르면 달력이 뜨도록 한다.
                      child: Text(DateTime.now().toString().substring(0, 10),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w400)),
                    ),
                    Expanded(
                      // TODO: 오른쪽 화살표를 누르면 다음 날짜로 넘어가도록 한다.
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
                          // TODO: 추가를 누르면 렌더링이 새로되어야 한다.
                          // 자료의 구조는 할일 내용과 할일 완료여부를 가져야 한다.
                          // 할일 완료여부는 기본값으로 false를 가져야 한다.
                          // 데이터는 로컬스토리지로 기기에 저장하자.
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
                  // TODO: 배열에 값이 추가되면 렌더링이 되어야 한다.
                  // TODO: 리스트 타일은 체크박스를 가지며 완료여부에 대한 상태를 가지고 있어야 한다.
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
                // TODO: 전체, 진행 중, 완료, 전체 삭제 버튼을 만들고 동작하게 한다.
                TextButton(onPressed: () {}, child: Text('전체')),
                TextButton(onPressed: () {}, child: Text('진행 중')),
                TextButton(onPressed: () {}, child: Text('완료')),

                // TODO: 전체 삭제 버튼을 누르면 배열을 비우고 렌더링이 되어야 한다.
                // 실수로 누르는 경우를 대비해서 버튼의 스타일을 변경하고 우측으로 정렬하자.
                TextButton(onPressed: () {}, child: Text('전체 삭제')),
              ],
            ),
          ),
        ));
  }
}
