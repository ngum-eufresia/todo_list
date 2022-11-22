import 'dart:html';
import 'storage.dart';
import 'main.dart';

loadingSpinner() {
  DivElement spinner = DivElement();
  Element span = Element.span();
  span.className = "visually-hidden";
  span.text = "visually hidden...";
  spinner.className = "spinner-border";
  spinner.children.add(span);
  return spinner;
}

myHeader() {}

myCheckbox(id) {
  InputElement input = InputElement();
  // ButtonElement butDone = ButtonElement();

  input.type = "checkbox";
  input.attributes = {
    "role": "button",
    "todo-id": id.toString(),
    "type": "checkbox"
  };
  input.className = "form-check-input me-2 checkbox cursor-pointer";
  input.onClick.listen(checkStatus);

  // butDone.children.add(input);
  // butDone.className = "border-0 background-none";
  // // butDone.onClick.listen(markDone);
  // print(input.value);
  // if (input.value == "off") {}
  return input;
}

// markDone() {
// displayCheckbox(text) {
//   Element td = Element.td();
//   InputElement input = InputElement();
//   ButtonElement butDone = ButtonElement();
//   DivElement div = DivElement();

//   input.type = "checkbox";
//   input.className = "form-check-input me-2";

//   butDone.children.add(input);
//   butDone.className = "border-0 background-none";
//   //check if there is a click event

//   if (butDone.onClick == true) {
//     butDone.onClick.listen(markDone);
//     status = 1;
//   }
//   div.children.add(butDone);
//   div.children.add((textInput(text)));
//   div.className = "d-flex align-items-center";

//   td.children.add(div);

//   return td;
// }

myTextInput(String text) {
  ButtonElement subTodo = ButtonElement();
  Element p = Element.p();
  Element td = Element.td();
  p.text = text;

  subTodo.type = "button";
  subTodo.innerHtml = "addSub";
  subTodo.className = "border-0 btn-rounded";
  td.children.add(p);
  td.children.add(subTodo);
  td.className = "flex align-items-center border-0";
  return td;
}

displayCheckbox(int? id) {
  Element td = Element.td();
  DivElement div = DivElement();
  // final doneBut = myCheckbox();
  final textInput = myCheckbox(id); //myTextInput(text);

  // div.children.add(doneBut);
  div.children.add(textInput);
  div.className = "d-flex align-items-center";

  td.children.add(div);

  return td;
}

// textInput(String text) {
//   DivElement div = DivElement();
//   div.text = text;
//   return div;
// }

dateInput(String date) {
  Element p = Element.p();
  Element td = Element.td();
  p.text = date;

  // div.children.add(input);

  p.className = "d-flex align-items-center";
  td.children.add(p);
  td.className = "align-middle";

  return td;
}

PrioritySelect(String priority) {
  Element p = Element.p();
  Element td = Element.td();

  p.text = priority;

  p.className = "d-flex align-items-center";

  if (p.text == "Low priority") {
    p.className = "badge bg-success md-0";
  } else if (p.text == "Middle priority") {
    p.className = "badge bg-warning md-0";
  } else if (p.text == "High priority") {
    p.className = "badge bg-danger md-0";
  }
  td.children.add(p);

  td.className = "align-middle";
  return td;
}

Actions(int? id) {
  DivElement div = DivElement();
  Element p1 = Element.p();
  ButtonElement butDelete = ButtonElement();
  ButtonElement butEdit = ButtonElement();

  Element p2 = Element.p();

  Element td = Element.td();
  p2.className = "fas fa-pencil-alt me-3";
  p1.className = "fas fa-trash-alt fa-lg text-warning";
  butDelete.id = id.toString();

  butDelete.type = "button";
  butDelete.className = "ms-4 border-0";
  butDelete.children.add(p1);
  butDelete.onClick.listen(removeTodo);

  butEdit.type = "button";
  butEdit.className = "ms-4 border-0";
  butEdit.id = id.toString();
  butEdit.children.add(p2);
  butEdit.onClick.listen(editTodo);
  print("Hello world");

  div.children.add(butEdit);
  div.children.add(butDelete);

  td.children.add(div);

  return td;
}

// markDone(completeList) {
//   Element td = Element.td();

//   Element button = (event!.currentTarget as Element);
//   int key = int.parse(button.id.split('-')[0]);
//   completeList.add((todo) => todo.id == key);

//   td.children.add(completeList);

//   todoList.removeWhere((todo) => todo.id == key);
//   print("printing  the new list");
//   print(completeList);
//   return td;
// }

buildUl(Element todo_checkbox, Element todo_text, Element todo_date,
    Element todo_priority, Element todo_action) {
  TableElement table = TableElement();
  Element tr = Element.tr();

  tr.children.add(todo_checkbox);
  tr.children.add(todo_text);
  tr.children.add(todo_date);
  tr.children.add(todo_priority);
  tr.children.add(todo_action);

  tr.className = "justify-content-md-center fw-normal";

  // table.children.add(tr);
  // table.className = "table text-white mb-0";
  return tr;
}

buildNewUi(Element todo_text, Element todo_date, Element todo_priority,
    Element todo_action) {
  Element tr = Element.tr();

  tr.children.add(todo_text);
  tr.children.add(todo_date);
  tr.children.add(todo_priority);
  tr.children.add(todo_action);

  tr.className = "justify-content-md-center fw-normal";

  // table.children.add(tr);
  // table.className = "table text-white mb-0";
  return tr;
}

// clearTodo(String id, String date) {
//   Element pEdit = Element.p();
//   ButtonElement buttonEdit = ButtonElement();
//   Element pDelete = Element.p();
//   ButtonElement buttonDelete = ButtonElement();
//   DivElement div_1 = DivElement();

//   // create edit element
//   pEdit.className = "fas fa-pencil-alt text-info";
//   buttonEdit.className = "border-0";
//   buttonEdit.children.add(pEdit);
//   // create delete element
//   pDelete.className = "fas fa-trash-alt text-danger";
//   buttonDelete.id = id;
//   buttonDelete.type = "button";
//   buttonDelete.className = "ms-2 border-0";
//   // aDelete.onClick.listen();
//   buttonDelete.children.add(pDelete);
//   buttonDelete.onClick.listen(removeTodo);
// }
// }
