import 'package:finalhackathon/app/app.locator.dart';
import 'package:finalhackathon/app/app.router.dart';
import 'package:finalhackathon/view/onboard_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:finalhackathon/viewmodel/party_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

class PartyView extends StatelessWidget {
  const PartyView({super.key});

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;
    var wi = MediaQuery.of(context).size.width;

    return ViewModelBuilder<PartyViewModel>.reactive(
      viewModelBuilder: () => PartyViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: Stack(
            clipBehavior: Clip.none,
            children: [
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
                    SizedBox(
                      width: wi * 0.3,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                        onPressed: () {
                          NavigationService().navigateTo(Routes.onboardView);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => OnboardView()));
                        },
                        child: Ink(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              colors: [Color(0xFFD61355), Color(0xFFFF0000)],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Container(
                            height: 55,
                            alignment: Alignment.center,
                            child: Text(
                              'Shop',
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: he * 0.1),
                    Image.asset('assets/images/lastpic.png'),
                    SizedBox(height: 350),
                  ],
                ),
              ),
              Positioned(
                bottom: he * 0.35,
                left: 10,
                right: 10,
                child: AbsorbPointer(
                  child: Image.asset('assets/images/pizza.png'),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SizedBox(
                  height: 250,
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
        PageController(viewportFraction: 0.42, initialPage: initialindex);
    int currentIndex = 2;

    Future.microtask(() {
      pageController.jumpToPage(initialindex);
    });

    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Stack(
                clipBehavior: Clip.none,
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
                          verticalOffset = -30;
                        }

                        return GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            debugPrint(
                                "Carousel item tapped: ${pizzas[index]['name']}");
                          },
                          child: Transform.translate(
                            offset: Offset(0, verticalOffset),
                            child: Transform.rotate(
                              angle: rotationAngle,
                              child: SizedBox(
                                width: 120,
                                height: 180,
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  alignment: Alignment.topCenter,
                                  children: [
                                    Positioned(
                                      bottom: 40,
                                      child: Container(
                                        width: 120,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(80),
                                            topRight: Radius.circular(80),
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
                                              width: 120,
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
