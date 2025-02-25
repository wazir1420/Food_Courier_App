import 'package:finalhackathon/view/onboard_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:finalhackathon/viewmodel/party_view_model.dart';

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
            clipBehavior: Clip.none,
            children: [
              // Background Column
              SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
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
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                    // Shop Button
                    GestureDetector(
                      onTap: () {
                        print("Shop button tapped!"); // Debugging
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OnboardView()),
                        );
                      },
                      child: Container(
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
                        child: Center(
                          child: Text(
                            'Shop',
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: he * 0.1), // Add some spacing
                    // Last Image
                    GestureDetector(
                      behavior: HitTestBehavior
                          .translucent, // Allows taps to be detected

                      onTap: () {
                        print("Last image tapped!"); // Debugging
                      },
                      child: Image.asset('assets/images/lastpic.png'),
                    ),
                    SizedBox(height: 350), // Space for the carousel
                  ],
                ),
              ),

              // Pizza Image (Non-interactive, so use IgnorePointer)
              Positioned(
                bottom: he * 0.35,
                left: 10,
                right: 10,
                child: IgnorePointer(
                  child: Image.asset('assets/images/pizza.png'),
                ),
              ),

              // Carousel Slider (Allow scrolling but pass through taps to buttons)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 350,
                  child: _buildCarouselSlider(),
                ),
              ),
            ],
          ),
        );
      },
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
    final initialindex = 2;
    final PageController pageController =
        PageController(viewportFraction: 0.43, initialPage: initialindex);
    int currentIndex = 2; // Start with Farmhouse at the center

    // Ensure the middle item is straight when the page is first loaded
    Future.microtask(() {
      pageController.jumpToPage(initialindex);
    });

    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 350, // Increase height to allow full visibility
              child: Stack(
                clipBehavior: Clip.none, // Allow overflow
                children: [
                  Positioned.fill(
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: pizzas.length,
                      onPageChanged: (index) {
                        setState(() => currentIndex = index);
                      },
                      itemBuilder: (context, index) {
                        double rotationAngle = 0.0;
                        double verticalOffset = 0.0;

                        if (index < currentIndex) {
                          rotationAngle = -0.35;
                        } else if (index > currentIndex) {
                          rotationAngle = 0.35;
                        } else {
                          verticalOffset = -30; // Moves center item up
                        }

                        return Transform.translate(
                          offset: Offset(0, verticalOffset),
                          child: Transform.rotate(
                            angle: rotationAngle,
                            child: SizedBox(
                              width: 120,
                              height: 180, // Increase container height
                              child: Stack(
                                clipBehavior: Clip.none, // Prevent clipping
                                alignment: Alignment.topCenter,
                                children: [
                                  // **The Main Container**
                                  Positioned(
                                    bottom:
                                        60, // Push it down so image is fully visible
                                    child: Container(
                                      width: 120,
                                      height: 150,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(50),
                                          topRight: Radius.circular(50),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                        border: Border.all(
                                          color: const Color(0xFFF4E9C7),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: 90,
                                            height: 100,
                                            decoration: const BoxDecoration(
                                              shape: BoxShape.circle,
                                            ),
                                            child: Image.asset(
                                              pizzas[index]['image']!,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            pizzas[index]['name']!,
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
