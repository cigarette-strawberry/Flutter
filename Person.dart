class Person {
  String name = "zf";
  int age = 10;
  Function sum = (a, b) {
    return a + b;
  };

  // 类的重写，你重写的类必须与当前类同名
  // 可以将无参变有参
  Person({required this.name, required this.age}) {}
}
