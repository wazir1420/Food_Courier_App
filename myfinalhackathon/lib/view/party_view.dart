import 'package:finalhackathon/view/onboard_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:finalhackathon/viewmodel/party_view_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PartyView extends StatelessWidget {
  const PartyView({super.key});

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;

    return ViewModelBuilder<PartyViewModel>.reactive(
      viewModelBuilder: () => PartyViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: he * 0.3,
                    child: Image.asset(
                      'assets/images/red.png',
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: he * 0.17),
                  Text(
                    'Farmhouse',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: he * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Large |'),
                      Text(
                        ' \$89',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: he * 0.01),
                  Text('Tomato, Mozzarella, Green basil, Olives,'),
                  Text('Bell pepper'),
                  SizedBox(height: he * 0.03),
                  _buildGradientButton(context),
                  Spacer(),
                  Container(
                      clipBehavior: Clip.none, child: _buildCarouselSlider()),
                ],
              ),
              Positioned(
                bottom: he * 0.35,
                left: 10,
                right: 10,
                child: Image.asset('assets/images/pizza.png'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildGradientButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          colors: [Color(0xFFFF5757), Color(0xFFFFD687)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OnboardView()),
          );
        },
        child: Center(
          child: Text(
            'Shop',
            style: TextStyle(
              fontSize: 17,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselSlider() {
    final List<Map<String, String>> pizzas = [
      {'name': 'Pepperoni', 'image': 'assets/images/pepperoni.png'},
      {'name': 'Chicken', 'image': 'assets/images/chickens.png'},
      {'name': 'Farmhouse', 'image': 'assets/images/framhouse.png'},
      {'name': 'Tomato', 'image': 'assets/images/tomato.png'},
      {'name': 'Strawberry', 'image': 'assets/images/strawberry.png'},
    ];

    final PageController pageController = PageController(viewportFraction: 0.3);
    int currentIndex = 2; // Start with Farmhouse at the center

    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          children: [
            SizedBox(
              height: 180, // Adjusted height
              child: PageView.builder(
                controller: pageController,
                itemCount: pizzas.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  double rotationAngle = 0;
                  double verticalOffset = 0; // Controls movement up/down

                  if (index < currentIndex) {
                    rotationAngle =
                        -0.35; // Left items rotate counterclockwise (~20 degrees)
                  } else if (index > currentIndex) {
                    rotationAngle =
                        0.35; // Right items rotate clockwise (~20 degrees)
                  } else {
                    verticalOffset = -20; // Center item moves up
                  }

                  return Transform.translate(
                    offset: Offset(0, verticalOffset), // Moves center item up
                    child: Transform.rotate(
                      angle: rotationAngle, // Apply rotation
                      child: Column(
                        children: [
                          Container(
                            height: 130,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                                topRight: Radius.circular(50),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                              border: Border.all(color: Color(0xFFF4E9C7)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: 10),
                                Container(
                                  width: 80,
                                  height: 80,
                                  decoration:
                                      BoxDecoration(shape: BoxShape.circle),
                                  child: Image.asset(
                                    pizzas[index]['image']!,
                                    width: 80,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  pizzas[index]['name']!,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
