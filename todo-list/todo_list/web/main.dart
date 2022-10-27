import 'dart:html';

// late InputElement todoInput;
// late DivElement uiList;
// late ButtonElement buttonAdd;

List<Todo> todoList = [];

void main() {
  // todoInput = querySelector('#todo') as InputElement;
  // uiList = querySelector('#todo-list') as DivElement;
  // buttonAdd = querySelector('#add') as ButtonElement;

  // buttonAdd.onClick.listen(addATodo);
}

// void addATodo(Event event) {
//   Todo todo = Todo(todoInput.value);
//   todoList.add(todo);
//   print(todoList);
//   todoInput.value = '';
// }

// void displayTodo() {
// // Item is now displayed on the page.
//   uiList!.children.clear();

//   todoList.forEach((todo) {
//     DivElement div = DivElement();
//     ButtonElement checkBox = ButtonElement();
//     Element span = Element.span();
//     InputElement checkbox = InputElement();

//     checkBox.type = "checkbox";

//     checkBox.text = '';
//     checkBox.id = todo.id.toString();
//     checkBox.onClick.listen(checkTodo);

//     span.text = todo.text;
//     div.children.add(checkbox);
//     div.children.add(span);
//     uiList!.children.add(div);
//   });
// }

// void checkTodo(MouseEvent event) {}

class Todo {
  static int _id = 0;
  int id = 0;
  String? text;

  Todo(
    this.text,
  ) : this.id = _id++;
}
