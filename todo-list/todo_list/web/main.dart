import 'dart:html';

late InputElement todoInput;
late InputElement checkbox;
late DivElement uiList;
late ButtonElement buttonAdd;
late ButtonElement buttonClear;
late ButtonElement buttonDone;
late TableElement tr;

List<Todo> todoList = [];
List<Todo> pleteList = [];

void main() {
  print("hello world");
  tr = querySelector('#table') as TableElement;
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
  Todo todo = Todo(todoInput.value);
  todoList.add(todo);
  displayTodo();
  todoInput.value = '';
}

void displayTodo() {
//Item is now displayed on the page.
  uiList.children.clear();

  todoList.forEach((todo) {
    DivElement div = DivElement();
    TableElement tr = TableElement();
    Element span = Element.span();
    ButtonElement buttonRemove = ButtonElement();
    ButtonElement buttonDone = ButtonElement();
    Element secondSpan = Element.span();

    Element colOne = Element.div();

    //  colOne.appendHtml(todo.priority.toString());

    buttonDone.id = todo.id.toString();
    buttonRemove.id = todo.id.toString();
    colOne.id = todo.id.toString();
    buttonRemove.onClick.listen(removeTodo);
    buttonDone.onClick.listen(todoDone);
    final checkbox = checkBoxBuild(todo.id.toString());

    // checkBox.id = todo.id.toString();
    // checkBox.onClick.listen(checkTodo);

    span.text = todo.todo;
    secondSpan.children.add(checkbox);
    tr.children.add(span);
    div.children.add(span);
    div.children.add(secondSpan);
    div.children.add(buttonRemove);
    div.children.add(buttonDone);
    div.children.add(colOne);
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

  Todo(String? userInput) {
    id = _id++;
    todo = userInput;
  }
}
