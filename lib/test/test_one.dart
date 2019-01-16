//Thanks to Dart's factory constructors, it's easy to build a singleton:

class Singleton {

  static final Singleton _singleton = new Singleton._internal();
  factory Singleton() => _singleton;
  Singleton._internal();
}

//You can construct it with new

void main() {
  var s1 = new Singleton();
  var s2 = new Singleton();
  print(identical(s1, s2)); // true
  print(s1 == s2); // true
}
