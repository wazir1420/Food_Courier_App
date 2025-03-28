import 'package:finalhackathon/view/chat_with_api_view.dart';
import 'package:finalhackathon/view/order_detail_view.dart';
import 'package:finalhackathon/view/product_view.dart';
import 'package:finalhackathon/view/profile_view.dart';
import 'package:finalhackathon/viewmodel/home_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  final String selectedAddress;

  const HomeView({super.key, required this.selectedAddress});

  @override
  Widget build(BuildContext context) {
    var he = MediaQuery.of(context).size.height;
    var we = MediaQuery.of(context).size.width;

    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, viewModel, child) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: he * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(Icons.menu),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Image.asset('assets/images/Frame.png'),
                              const SizedBox(width: 5),
                              Text(selectedAddress),
                            ],
                          ),
                        ),
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('assets/images/wazir.jpg'),
                        ),
                      ],
                    ),
                    SizedBox(height: he * 0.03),
                    TextFormField(
                      decoration: InputDecoration(
                        fillColor: const Color.fromARGB(255, 244, 207, 220),
                        filled: true,
                        prefixIcon: const Icon(Icons.search, size: 30),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Search',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: he * 0.03),
                    SizedBox(
                      height: 120,
                      child: PageView(
                        controller: viewModel.pageController,
                        onPageChanged: viewModel.setCurrentPage,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/p3.png',
                              fit: BoxFit.cover,
                              width: we,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/p2.jpg',
                              fit: BoxFit.cover,
                              width: we,
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              'assets/images/p1.jpg',
                              fit: BoxFit.cover,
                              width: we,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        return _buildIndicator(viewModel, index);
                      }),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 10,
                        children: [
                          customContainers(context,
                              image: 'assets/images/burger.png',
                              name: 'Burger',
                              color: Color(0xFFD61355),
                              bordercolor: Color(0xFFD61355),
                              width: 0,
                              textColor: Colors.white),
                          customContainers(context,
                              image: 'assets/images/pizzas.png',
                              name: 'Pizza',
                              color: Colors.white,
                              bordercolor: Colors.amberAccent,
                              width: 2,
                              textColor: Colors.black),
                          customContainers(context,
                              image: 'assets/images/sandwich.png',
                              name: 'Sandwich',
                              color: Colors.white,
                              bordercolor: Colors.amberAccent,
                              width: 2,
                              textColor: Colors.black)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 5,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductView(
                                          image: 'assets/images/fullburger.png',
                                          title: 'Chicken Burger',
                                          description:
                                              "In a medium bowl, add ground chicken, breadcrumbs, mayonnaise, onions, parsley, garlic, paprika, salt and pepper. Use your hands to combine all the ingredients together until blended, but don't over mix.Chicken Tomatoa Lettuse Preheat grill to medium-high heat and oil the grates. Form the mixture into 4-6 equal patties")));
                            },
                            child: customContainer(context,
                                image: 'assets/images/chicken.png',
                                name: 'Chicken Burger',
                                pcs: '100 gram chicken',
                                price: '20.00',
                                ratting: '3.8'),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductView(
                                          image:
                                              'assets/images/cheese-burger.png',
                                          title: 'Cheese Burger',
                                          description:
                                              "A cheeseburger is a hamburger topped with cheese. Traditionally, the slices of cheese is placed on top of the meat patty. The cheese is usually added to the cooking hamburger patty shortly before serving, which allows the cheese to melt. Cheeseburgers can include variations in structure, ingredients and composition. As with other hamburgers, a cheeseburger may include toppings such as lettuce, tomato, onion, pickles, bacon, mayonnaise, ketchup, and mustard.")));
                            },
                            child: customContainer(context,
                                image: 'assets/images/zinger.png',
                                name: 'Cheese Burger',
                                pcs: '100 gram chicken',
                                price: '15.00',
                                ratting: '4.5'),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductView(
                                          image:
                                              'assets/images/zinger-burger.jpg',
                                          title: 'Zinger Burger',
                                          description:
                                              "Arabi shawarma is renowned for its mouthwatering flavors and irresistible offerings, and their Mega Zinger Burger takes it to a whole new level. This delectable creation boasts not one, but two succulent zinger patties, making it a true treat for burger enthusiasts. With each bite, you are greeted with a burst of bold and savory flavors that perfectly blend together. The crispy texture of the zinger patties, combined with the freshness of the ingredients, creates an unforgettable experience for your taste buds. Whether you're a fan of Arabi shawarma or simply a burger lover, the Mega Zinger Burger is a must-try. Indulge in this ultimate burger delight and satisfy your cravings like never before.")));
                            },
                            child: customContainer(context,
                                image: 'assets/images/zing.png',
                                name: 'Zinger Burger',
                                pcs: '100 gram chicken',
                                price: '25.00',
                                ratting: '4.6'),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Popular Meal Menu',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text('See all'),
                            Icon(Icons.arrow_forward_ios)
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              width: 1, color: Colors.grey.shade300)),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.asset(
                              'assets/images/chicken.png',
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Zinger Burger',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text('5kg box of pizza')
                            ],
                          ),
                          SizedBox(
                            width: we * 0.1,
                          ),
                          Text(
                            '\$15',
                            style: TextStyle(
                                color: Color(0xFFD61355),
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: viewModel.selectedIndex,
            selectedItemColor: const Color(0xFFD61355),
            unselectedItemColor: Colors.grey,
            items: [
              BottomNavigationBarItem(
                icon: viewModel.selectedIndex == 0
                    ? Container(
                        height: 30,
                        width: 60,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 238, 186, 204),
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Icon(Icons.home),
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          viewModel.updateSelectedIndex(0);
                        },
                        icon: Icon(Icons.home,
                            color: viewModel.selectedIndex == 0
                                ? const Color(0xFFD61355)
                                : Colors.grey),
                      ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    viewModel.updateSelectedIndex(1);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileView())).then((_) {
                      viewModel.resetSelectedIndex();
                    });
                  },
                  icon: viewModel.selectedIndex == 1
                      ? Container(
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 238, 186, 204),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Icon(Icons.person),
                          ),
                        )
                      : Icon(Icons.person,
                          color: viewModel.selectedIndex == 1
                              ? const Color(0xFFD61355)
                              : Colors.grey),
                ),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    viewModel.updateSelectedIndex(2);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OrderDetailView())).then((_) {
                      viewModel.resetSelectedIndex();
                    });
                  },
                  icon: viewModel.selectedIndex == 2
                      ? Container(
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 238, 186, 204),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Icon(Icons.shopping_cart),
                          ),
                        )
                      : Icon(Icons.shopping_cart,
                          color: viewModel.selectedIndex == 2
                              ? const Color(0xFFD61355)
                              : Colors.grey),
                ),
                label: 'Cart',
              ),
              BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    viewModel.updateSelectedIndex(3);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChatbotScreen())).then((_) {
                      viewModel.resetSelectedIndex();
                    });
                  },
                  icon: viewModel.selectedIndex == 3
                      ? Container(
                          height: 30,
                          width: 60,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 238, 186, 204),
                              borderRadius: BorderRadius.circular(15)),
                          child: Center(
                            child: Icon(Icons.chat),
                          ),
                        )
                      : Icon(Icons.chat,
                          color: viewModel.selectedIndex == 3
                              ? const Color(0xFFD61355)
                              : Colors.grey),
                ),
                label: 'Chat',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildIndicator(HomeViewModel viewModel, int index) {
    bool isActive = viewModel.currentPage == index;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.red : Colors.grey,
        borderRadius: BorderRadius.circular(isActive ? 5 : 50),
      ),
    );
  }
}

Widget customContainer(BuildContext context,
    {required String image,
    required String name,
    required String pcs,
    required String price,
    required String ratting}) {
  var he = MediaQuery.of(context).size.height;
  var we = MediaQuery.of(context).size.width;

  return Container(
    height: he * 0.32,
    width: we * 0.45,
    decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(30)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Text(ratting),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                width: we * 0.3,
                height: he * 0.1,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          Text(pcs),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ $price',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.red),
                child: Center(
                  child: Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget customContainers(BuildContext context,
    {required String image,
    required String name,
    required Color color,
    required Color bordercolor,
    required double width,
    required Color textColor}) {
  var we = MediaQuery.of(context).size.width;
  return Container(
    height: 50,
    width: we * 0.55,
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: bordercolor, width: width)),
    child: Row(
      children: [
        Image.asset(
          image,
          height: 50,
          width: 50,
        ),
        Text(
          name,
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: textColor),
        )
      ],
    ),
  );
}
