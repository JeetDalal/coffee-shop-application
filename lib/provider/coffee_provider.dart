import 'package:coffeeapp/provider/coffee.dart';
import 'package:flutter/cupertino.dart';

class CoffeeProvider with ChangeNotifier {
  final List<Coffee> _coffeeList = [
    Coffee(
      quantity: 0,
      briefDescription:
          'A cappuccino  is an espresso-based coffee drink that originated in Italy and is prepared with steamed milk foam (microfoam).Variations of the drink involve the use of cream instead of milk, using non-dairy milk substitutes and flavoring with cinnamon or chocolate powder.[2][3] It is typically smaller in volume than a caffè latte, with a thicker layer of microfoam.',
      totalRating: '1,000 +',
      rating: 4.5,
      coffeeName: 'Cappuccino',
      id: DateTime.now().toString(),
      description: 'with Oat Milk',
      imageUrl: 'images/coffee1.jpg',
      price: 3.99,
      isFavourite: false,
    ),
    Coffee(
      quantity: 0,
      briefDescription:
          'A cappuccino  is an espresso-based coffee drink that originated in Italy and is prepared with steamed milk foam (microfoam).Variations of the drink involve the use of cream instead of milk, using non-dairy milk substitutes and flavoring with cinnamon or chocolate powder.[2][3] It is typically smaller in volume than a caffè latte, with a thicker layer of microfoam.',
      totalRating: '500 +',
      rating: 4.3,
      coffeeName: 'Cappuccino',
      id: DateTime.now().toString(),
      description: 'with Chocolate',
      imageUrl: 'images/coffee2.jpg',
      price: 4.99,
      isFavourite: false,
    ),
    Coffee(
      quantity: 0,
      briefDescription:
          'A cappuccino  is an espresso-based coffee drink that originated in Italy and is prepared with steamed milk foam (microfoam).Variations of the drink involve the use of cream instead of milk, using non-dairy milk substitutes and flavoring with cinnamon or chocolate powder.[2][3] It is typically smaller in volume than a caffè latte, with a thicker layer of microfoam.',
      totalRating: '100 +',
      rating: 4.0,
      coffeeName: 'Cappuccino',
      id: DateTime.now().toString(),
      description: 'without Milk',
      imageUrl: 'images/coffee3.jpg',
      price: 5.99,
      isFavourite: false,
    ),
    Coffee(
      quantity: 0,
      briefDescription:
          'A cappuccino  is an espresso-based coffee drink that originated in Italy and is prepared with steamed milk foam (microfoam).Variations of the drink involve the use of cream instead of milk, using non-dairy milk substitutes and flavoring with cinnamon or chocolate powder.[2][3] It is typically smaller in volume than a caffè latte, with a thicker layer of microfoam.',
      totalRating: '2,000 +',
      rating: 4.8,
      coffeeName: 'Cappuccino',
      id: DateTime.now().toString(),
      description: 'with Caramel',
      imageUrl: 'images/coffee4.jpg',
      price: 6.99,
      isFavourite: false,
    ),
    Coffee(
      quantity: 0,
      briefDescription:
          'A cappuccino  is an espresso-based coffee drink that originated in Italy and is prepared with steamed milk foam (microfoam).Variations of the drink involve the use of cream instead of milk, using non-dairy milk substitutes and flavoring with cinnamon or chocolate powder.[2][3] It is typically smaller in volume than a caffè latte, with a thicker layer of microfoam.',
      totalRating: '5,000 +',
      rating: 4.6,
      coffeeName: 'Cappuccino',
      id: DateTime.now().toString(),
      description: 'with Nuts',
      imageUrl: 'images/coffee5.jpg',
      price: 7.99,
      isFavourite: false,
    ),
  ];
  List<Coffee> get coffeeItem => [..._coffeeList];
  // int _counter = 0;
  bool _isFav = false;

  void increment(int quantity) {
    quantity++;
  }

  void decrement(int quantity) {
    quantity <= 0 ? 0 : quantity--;
  }

  //Favourite Coffee Code Logic
  List<Coffee> _favouritesList = [];

  List<Coffee> get favCoffeeList {
    return _coffeeList.where((element) => element.isFavourite == true).toList();
  }

  bool addToFavourites() {
    _isFav = !_isFav;
    return _isFav;
  }
}
