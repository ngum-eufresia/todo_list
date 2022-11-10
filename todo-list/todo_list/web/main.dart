import 'dart:html' hide File;
import 'storage.dart';
import 'dart:convert';
import 'display.dart';

late InputElement todoInput;
late InputElement checkbox;
late DivElement uiList;
late DivElement date;
late DivElement priority;
late DivElement actions;
late ButtonElement buttonAdd;
late ButtonElement buttonClear;

late ButtonElement buttonDone;
late TableElement table;
late TableElement tr;

List<Todo> todoList = [];
List<Todo> pleteList = [];

void main() {
  date = querySelector('#date') as DivElement;
  priority = querySelector('#priority') as DivElement;
  actions = querySelector('#actions') as DivElement;
  todoInput = querySelector('#todo') as InputElement;
  uiList = querySelector('#todo-list') as DivElement;
  buttonAdd = querySelector('#add') as ButtonElement;
  buttonClear = querySelector('#clear') as ButtonElement;

  todoInput.onChange.listen(addATodo);
  buttonAdd.onClick.listen(addATodo);
}

void addATodo(Event event) {
  if (todoInput.value == '') {
    return;
  }
  Todo todo = Todo(todoInput.value, date, priority);
  todoList.add(todo);
  displayTodo();
  todoInput.value = '';
}

void displayTodo() {
//Item is now displayed on the page.
  uiList.children.clear();

  todoList.forEach((todo) {
    DivElement div = DivElement();

    DivElement date = DivElement();
    DivElement priority = DivElement();
    DivElement actions = DivElement();
    TableElement tr = TableElement();
    Element span = Element.span();
    ButtonElement buttonRemove = ButtonElement();
    ButtonElement buttonDone = ButtonElement();
    Element secondSpan = Element.span();

    //  colOne.appendHtml(todo.priority.toString());

    buttonDone.id = todo.id.toString();
    tr.id = todo.id.toString();
    buttonRemove.id = todo.id.toString();
    date.id = todo.id.toString();
    priority.id = todo.id.toString();
    actions.id = todo.id.toString();
    buttonRemove.onClick.listen(removeTodo);
    buttonDone.onClick.listen(todoDone);
    final checkbox = checkBoxBuild(todo.id.toString());

    // checkBox.id = todo.id.toString();
    // checkBox.onClick.listen(checkTodo);

    span.text = todo.todo;

    secondSpan.children.add(checkbox);
    tr.children.add(span);
    div.children.add(span);
    div.children.add(buttonRemove);
    div.children.add(buttonDone);
    tr.children.add(date);
    tr.children.add(priority);
    tr.children.add(actions);
    div.children.add(tr);

    uiList.children.add(div);
  });
}

checkBoxBuild(String id) {
  InputElement inputElement = InputElement();
  DivElement div = DivElement();

  inputElement.type = "checkbox";
  inputElement.id = id;
  div.children.add(inputElement);
  return div;
}

void removeTodo(MouseEvent event) {
  event.stopPropagation();

  Element? div = (event.currentTarget as Element).parent;
  Element button = (event.currentTarget as Element);

  int key = int.parse(button.id.split('-')[0]);
  todoList.removeWhere((todo) => todo.id == key);

  div?.remove();
}

void todoDone(MouseEvent event) {
  event.stopPropagation();

  Element? div = (event.currentTarget as Element).parent;
  Element button = (event.currentTarget as Element);

  int key = int.parse(button.id.split('-')[0]);
  print("The id is $key");
  Iterable<Todo> complete = todoList.where((todo) => todo?.id == key);
  print("this task was just completed ${complete.first!.todo}");
  pleteList.add(complete.first);
  print("Length of complete list is ${pleteList.length}");
}

void checkTodo(MouseEvent event) {
  Element? div = (event.currentTarget as Element).parent;
  Element input = (event.currentTarget as Element);

  int key = int.parse(input.id.split('-')[0]);
  //todoList.addWhere((todo) => todo?.id == key);
}

// addWhere(bool state) {}

class Todo {
  static int _id = 0;
  int id = 0;
  String? todo;
  String date;
  String priority;

  Todo(this.todo, this.date, this.priority) : id = _id++;
  Todo.whereJason(Map<String, dynamic> json)
      : id = json['id'],
        todo = json['text'],
        date = json['dateTime'],
        priority = json['priority'];

  Map<String, dynamic> toJson() =>
      {'id': id, 'text': todo, 'dateTime': date, 'priority': priority};
}
