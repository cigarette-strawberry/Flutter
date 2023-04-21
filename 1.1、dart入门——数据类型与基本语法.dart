/* 
数据类型
  数值型 Number
  字符串 String
  布尔值 Boolean
  列表 List
  键值对 Map
    Map 数据类型取值要用 []，不要用 .
  Runes、Symbols (不常用)

  var final const 三者都不规定数据类型
 */

/* 
常量
  const声明常量
  使用const声明的必须是编译器的常量。
  注：final 赋值后可以再修改，const不能修改

  var 泛型，不规定数据类型 对数据类型进行自动识别
    1、使用var的时候，如果你只声明 不赋值 那么它所能够识别的数据类型是 dynamic (指的是泛型)
    2、如果声明加赋值，那么它会自动对赋值的数据进行数据类型的识别
  const 常量 声明和赋值同时进行，不能重新赋值，区别：const 定义的值一旦声明就不能修改，const后面的值不能是运行后的结果
  final 只赋值一次 声明和赋值同时进行，不能重新赋值，区别：final 定义的值声明之后可以再修改，final后面的值可以是运行后的结果

  flutter中父子组件传递参数不能用const接受，我们用final
 */
void main() {
  print("hello dart!");

  var n;
  n ??= 20; // 若n为空则赋值
  print(n);

  var a = "Dart";
  var b = "Java";
  var c = a ?? b; // 前面的值不为空，取前者，前面值为空，取后者。
  print(c);
}
