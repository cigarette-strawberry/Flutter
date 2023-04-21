import "Person.dart";

void main() {
  var person = new Person(name: 'xiaowu', age: 12);

  print(person.name);
  print(person.age);
  print(person.sum(10, 20));
}
