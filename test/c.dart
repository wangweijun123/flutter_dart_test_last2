// 全局变量当然能被引用的地方使用
const num = 100;

void gloabMethod() {
  print('');
}

//
void _gloabMethod2() {
  ClassInC c = ClassInC();

  print('c._b = ${c._b}');
}

class ClassInC {
  int a = 0;

  // 私有变量, 指的是在整个文件都能使用, 在其他文件不能使用
  int _b = 100;
}
