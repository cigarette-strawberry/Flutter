void main() {
  // 将系统函数 print 作为参数传递
  List list = ["a", "b", "c"];
  list.forEach(print); // => a b c

  // print(strRepeat("dart"));

  List list2 = ["h", "e", "l", "l", "o"];
  print(listTimes(list2, strRepeat)); // => [hhh, eee, lll, lll, ooo]
}

void printHello() {
  print("hello dart!");
}

String strRepeat(str) => str * 3;
String strRepeat2(str) => str * 4;

// 传递回调函数，依然可以为传递的回调函数返回值定义类型
// 定义数据类型 函数名() 可以这样传参
List listTimes(List list, String fn(s)) {
  for (var i = 0; i < list.length; i++) {
    list[i] = fn(list[i]);
  }
  return list;
}
