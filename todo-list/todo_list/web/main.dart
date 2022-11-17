import 'dart:convert';
import 'dart:html' hide File;
import 'storage.dart';
import 'display.dart';
import "package:collection/collection.dart";

late InputElement todoInput;
late InputElement checkbox;
late DivElement uiList;
//late DivElement ui1List;
late InputElement dateElement;
late SelectElement priority;
// late DivElement actions;
late ButtonElement buttonAdd;
late ButtonElement buttonClear;

late ButtonElement buttonDone;
late TableElement table;
late TableElement tr;
late TableSectionElement mytableBody;

late InputElement checkam;

// List<Todo> todoList = [];
List<Todo> pleteList = [];
// int status = 0;
bool var_status = true;

void main() {
  // checkam = querySelector('.checkbox') as InputElement;
  dateElement = querySelector('#due') as InputElement;
  priority = querySelector('#priority') as SelectElement;
  // actions = querySelector('#actions') as DivElement;
  todoInput = querySelector('#todo') as InputElement;
  uiList = querySelector('#todo-list') as DivElement;
  //ui1List = querySelector('#done-todo') as DivElement;
  buttonAdd = querySelector('#add') as ButtonElement;
  buttonClear = querySelector('#clear') as ButtonElement;
  mytableBody = querySelector("table#table tbody") as TableSectionElement;
  print("check box value");

  // print(checkam.checked);

  buttonAdd.onClick.listen(addATodo);
  // checkam.onClick.listen(checkStatus);
  // final check = myCheckbox();

  todoList = mystorage();
}

void addATodo(Event event) {
  if (todoInput.value == '') {
    return;
  }
  Todo todo =
      Todo(todoInput.value, dateElement.value.toString(), priority.value!);
  todoList.add(todo);
  displayTodo();
  //completeTodo();
  addStorage(todoList);
  todoInput.value = '';
  dateElement.value = '';
  priority.value = '';
}

checkStatus(MouseEvent event) {
  Element todoCheckbox = (event.currentTarget as Element);
  int todoId = int.parse(todoCheckbox.getAttribute("todo-id")!);
  print("================todo list before update==========");
  print(todoList);
  List<Todo> jList = [];
  todoList.forEach((todo) {
    print("todo.id {todo.id}");
    print("todoId {todoId}");
    if (todo.id == todoId) {
      todo.status = 1;
    }
    jList.add(todo);
  });
  // for (Todo todo  in todoList) {
  //             if (todo.id == todoId)
  //             {
  //               todo.status = 1;
  //             }

  // }

  // todoList = todoList.map((todo) => {
  //           if (todo.id == todoId)
  //           {
  //             todo.status = 1;
  //           }
  //           return todo;
  //           })  as List<Todo>;
  print("=====todo list after update====");
  todoList = jList;
  print(jList);

  // -update the status of the element id and create a new array(//use map function)
  //todoList(Map<String, String> value) {
  // var todoLists= [
  //   {"todoId": int.parse(todoCheckbox.getAttribute("todo-id")!)}
  // ];

  // List newlist = groupBy(todoLists, (Map obj) => obj['todoId']) as List;

//newlist = todoList;

  // newArr(Map<String, String> value) {
  //   Map<String, String> attributes = newArr(value);
  //   for (String key in value.keys) {
  //     attributes[key] = value[key]!;
  //   }
  // }

  addStorage(todoList);
  displayTodo();

//     var newlist = groupBy(todoList, (Map obj) => obj['todoId']);

//     var newlist = groupBy(todoList, (Map obj) => obj['todoId']);

  // var newlist = groupBy(newArr, (Map obj) => obj['p_id']);

  // var requiredOutput = [
  //   {"Subitems": []}
  // ];
  // newlist.forEach((k, v) => {
  //       requiredOutput[0]["Subitems"]!.add({"p_id": k, "items": v})
  //     });

  // print(requiredOutput);

  //   todo = todo.map((obj)=>{
  //   if(obj.id == elem_id){
  //   obj.status == 1
  //   }
  //   return obj
  //   })
  // final check = myCheckbox();
  // check.Onclick.listen();
  //   return var_status;
  /**
   * TODOs
   * -get element id
   * 
   * -update the status of the element id and create a new array(//use map function)
   * (
   * elem_id = event.target.value;
   * todo = todo.map((obj)=>{
   *  if(obj.id == elem_id){
   * obj.status == 1
   * }
   * return obj
   * })
   * 
   * )
   * -assign new array to Todos array
   * -save updated todo to local storage
   * -call display todos function
   */
}

void displayTodo() {
//Item is now displayed on the page.
  // final spin = loadingSpinner(  uiList.children.clear();
  uiList.children.clear();
  Element tbody = Element.table();
  Element myTable = Element.table();
  DivElement div = DivElement();
  mytableBody.innerHtml = "";

  todoList.forEach((todo) {
    print(todo.status);
    print(todo.status == 0);
    if (todo.status == 0) {
      final checkbox = displayCheckbox(todo.id);
      final text = myTextInput(todo.todo!);
      final date = dateInput(todo.date);
      final prio = PrioritySelect(todo.priority);
      final action = Actions(todo.id);
      final ui = buildUl(
          checkbox, text, date, prio, action); //(checkbox, date, prio, action);

      mytableBody.children.add(ui);
      //myTable.children.add(ui);

      tbody.className = "table text-white mb-0";
      // myTable.className = "table text-white mb-2";
      // final text = myTextInput(todo.todo!);
      // final doneDate = dateInput(todo.date);
      // final newUi = buildUl(text, doneDate, text, doneDate);
      // tbody.children.add(newUi);
      // tbody.className = "table table-dark table-striped mt-5";
    }
    //  else {
    //   final checkbox = displayCheckbox(todo.todo!);
    //   final date = dateInput(todo.date);
    //   final prio = PrioritySelect(todo.priority);
    //   final action = Actions(todo.id);

    //   final ui = buildUl(checkbox, date, prio, action);

    //   tbody.children.add(ui);
    //   //myTable.children.add(ui);

    //   tbody.className = "table text-white mb-0";
    //   // myTable.className = "table text-white mb-2";
    // }
  });

  // uiList.children.add(tbody);
}

// completeTodo() {
//   DivElement div = DivElement();

//   todoList.forEach((todo) {
//     final text = myTextInput(todo.todo!);
//     if (markDone()) {
//       div.children.add(text);
//     }
//   });
//   ui1List.children.add(div);
// }

// InputElement date = InputElement();
// DivElement priority = DivElement();
// DivElement actions = DivElement();
// TableElement tr = TableElement();
// Element span = Element.span();
// ButtonElement buttonRemove = ButtonElement();
// ButtonElement buttonDone = ButtonElement();
// Element secondSpan = Element.span();

//  colOne.appendHtml(todo.priority.toString());

// buttonDone.id = todo.id.toString();
// tr.id = todo.id.toString();
// buttonRemove.id = todo.id.toString();
// date.id = todo.id.toString();
// priority.id = todo.id.toString();
// actions.id = todo.id.toString();
// buttonRemove.onClick.listen(removeTodo);
// buttonDone.onClick.listen(todoDone);
// final checkbox = checkBoxBuild(todo.id.toString());

// checkBox.id = todo.id.toString();
// checkBox.onClick.listen(checkTodo);

//     span.text = todo.todo;

//     secondSpan.children.add(checkbox);
//     tr.children.add(span);
//     div.children.add(span);
//     div.children.add(buttonRemove);
//     div.children.add(buttonDone);
//     tr.children.add(date);
//     tr.children.add(priority);
//     tr.children.add(actions);
//     div.children.add(tr);

//     uiList.children.add(div);
//   });
// }

// checkBoxBuild(String id) {
//   InputElement inputElement = InputElement();
//   DivElement div = DivElement();

//   inputElement.type = "checkbox";
//   inputElement.id = id;
//   div.children.add(inputElement);
//   return div;
// }

void removeTodo(MouseEvent event) {
  print('Todolist');
  Element button = (event.currentTarget as Element);
  int key = int.parse(button.id.split('-')[0]);
  todoList.removeWhere((todo) => todo.id == key);
  print("after removing todo");
  addStorage(todoList);
  displayTodo();
  print("hello");
}

void editTodo(MouseEvent) {}

// void todoDone(MouseEvent event) {
//   event.stopPropagation();

//   Element? div = (event.currentTarget as Element).parent;
//   Element button = (event.currentTarget as Element);

//   int key = int.parse(button.id.split('-')[0]);
//   print("The id is $key");
//   Iterable<Todo> complete = todoList.where((todo) => todo?.id == key);
//   print("this task was just completed ${complete.first!.todo}");
//   pleteList.add(complete.first);
//   print("Length of complete list is ${pleteList.length}");
// }

// void checkTodo(MouseEvent event) {
//   Element? div = (event.currentTarget as Element).parent;
//   Element input = (event.currentTarget as Element);

//   int key = int.parse(input.id.split('-')[0]);
//todoList.addWhere((todo) => todo?.id == key);
// }

// addWhere(bool state) {}

class Todo {
  static int _id = ++todoId;
  int? id;
  String? todo;
  String date;
  String priority;
  int status = 0;

  Todo(this.todo, this.date, this.priority) : id = _id++;
  Todo.whereJason(Map<String, dynamic> json)
      : id = json['id'],
        todo = json['text'],
        date = json['dateTime'],
        priority = json['priority'],
        status = json['status'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'text': todo,
        'dateTime': date,
        'priority': priority,
        'status': status
      };
}
