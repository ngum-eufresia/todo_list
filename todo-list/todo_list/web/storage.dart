import 'dart:convert';
import 'dart:html';
import 'main.dart';
import 'storage.dart';

late dynamic todoArr;
late InputElement todoInput;
List<Todo> todoList = [];
late int todoId;

mystorage() {
  todoArr = window.localStorage['myTodo'];
  if (todoArr == "" || (todoArr == null)) {
    window.localStorage['myTodo'] = todoList.toString();
    todoArr = window.localStorage['myTodo'];
  }

  print("we are making progress");

  final myTodo = jsonDecode(todoArr);
  print(myTodo);
  myTodo.forEach((element) {
    Todo singleTodo = Todo.whereJason(element);
    todoList.add(singleTodo);
  });

  if (todoList.isEmpty || todoList == null) {
    todoId = 0;
  } else {
    todoId = todoList.elementAt(todoList.length - 1).id;
  }

  displayTodo();
  print('Finished Getting Local storage...');
  return todoList;
}

addStorage(List todolist) {
  print('\n adding to local storage');
  window.localStorage["myTodo"] = jsonEncode(todolist);
  final done = window.localStorage['todos'];

  print(done);

  print('\n done adding');
  // displayTodo(todoList, 'Finished adding to local storage');
}
