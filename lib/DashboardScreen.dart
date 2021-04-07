import 'package:coffee_ui_challenge/coffee_object.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoffeeConceptDashboard extends StatefulWidget {
  @override
  _CoffeeConceptDashboardState createState() => _CoffeeConceptDashboardState();
}

class _CoffeeConceptDashboardState extends State<CoffeeConceptDashboard> {
  final _pageCoffeeController = PageController(
    viewportFraction: 0.35,
  );

  double currentPage = 0.0;

  void _coffeeScrollListener() {
    setState(() {
      currentPage = _pageCoffeeController.page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageCoffeeController.addListener(_coffeeScrollListener);
  }

  @override
  void dispose() {
    _pageCoffeeController.removeListener(_coffeeScrollListener);
    _pageCoffeeController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            child: Container(
              color: Colors.red,
            ),
            top: 0,
            left: 0,
            right: 0,
            height: 100,
          ),
          PageView.builder(
            itemBuilder: (context, index) {
              if (index == 0) {
                return const SizedBox.shrink();
              }
              final coffee = coffees[index];
              final result = currentPage - index + 1;
              final value = -0.4 * result + 1;
              return Transform(
                alignment: Alignment.bottomCenter,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..translate(
                      0.0,
                      MediaQuery.of(context).size.height /
                          2.6 *
                          (1 - value).abs())
                  ..scale(value),
                child: Image.asset(coffee.image),
              );
            },
            itemCount: coffees.length,
            scrollDirection: Axis.vertical,
            controller: _pageCoffeeController,
          ),
        ],
      ),
    );
  }
}
