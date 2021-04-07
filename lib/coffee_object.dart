import 'dart:math';

class Coffee {
  final String name;
  final String image;
  final String price;

  Coffee({this.name, this.image, this.price});
}

final _names = [
  'Caramel Cold Coffee',
  'Iced Coffee Mocha',
  'Caramelized Pecan Latte',
  'Toffee Nut Latte',
  'Capuchino',
  'Toffee Nut Iced Latte',
];

double _doubleInRange(Random source, num start, num end) =>
    source.nextDouble() * (end - start);

final random = Random();
final coffees = List.generate(
  _names.length,
  (index) => Coffee(
      name: _names[index], image: 'images/${index + 1}.png', price: 'Rs.100'),
);
