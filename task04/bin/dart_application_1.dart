import 'dart:math';

abstract class Shape {
  double calculateArea();
}

class Square extends Shape {
  double side;

  Square(this.side);

  @override
  double calculateArea() {
    return side * side;
  }
}

class Rectangle extends Shape {
  double width, height;

  Rectangle(this.width, this.height);

  @override
  double calculateArea() {
    return width * height;
  }
}

class Circle extends Shape {
  double radius;

  Circle(this.radius);

  @override
  double calculateArea() {
    return pi * radius * radius;
  }
}

void main() {
  Shape square = Square(5);
  Shape rectangle = Rectangle(4, 6);
  Shape circle = Circle(3);

  print("  ${square.calculateArea()}"); 
  print(" ${rectangle.calculateArea()}"); 
  print(" ${circle.calculateArea()}"); 
}
