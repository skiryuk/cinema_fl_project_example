import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_meetup/detail_page.dart';

import 'dart:math' as math;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Icon(Icons.person),
          title: const Text('MOVIES'),
          centerTitle: true,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 16),
              child: const Icon(Icons.notifications),
            )
          ]),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          LocationWidget(),
          CarouselNewsWidget(), // NewsWidget(),
          FilterWidget(),
          Expanded(flex: 3, child: ImageCarousel()),
          Spacer(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation_outlined),
            label: 'Films',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplane_ticket),
            label: 'Tickets',
          ),
        ],
      ),
    );
  }
}

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.location_pin),
              Container(
                margin: const EdgeInsets.only(left: 8),
                child: const Text('MOSCOW'),
              )
            ],
          ),
          const Icon(Icons.keyboard_arrow_down_sharp),
        ],
      ),
    );
  }
}

class NewsWidget extends StatelessWidget {
  const NewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          'assets/images/headline.jpeg',
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            children: [
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(bottom: 8, right: 4),
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 8, right: 4),
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 8),
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 8, left: 4),
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 8, left: 4),
                child: Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                ),
              ),
              const Spacer(),
            ],
          ),
        )
      ],
    );
  }
}

class CarouselNewsWidget extends StatefulWidget {
  const CarouselNewsWidget({super.key});

  @override
  State<CarouselNewsWidget> createState() => _CarouselNewsWidgetState();
}

class _CarouselNewsWidgetState extends State<CarouselNewsWidget> {
  final CarouselController _carouselController = CarouselController();

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _carouselController.addListener(() {
      if (_carouselController.hasClients) {
        int partOffset =
            (_carouselController.position.maxScrollExtent / 3).floor();
        setState(() {
          currentIndex = math.max(
              ((_carouselController.offset - 150) / partOffset).floor(), 0);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          Container(
            height: 300,
            child: CarouselView(
              controller: _carouselController,
              children: [
                Image.asset(
                  'assets/images/headline.jpeg',
                ),
                Image.asset(
                  'assets/images/interstellar.jpg',
                ),
                Image.asset(
                  'assets/images/incoming.jpg',
                ),
              ],
              itemExtent: 500,
            ),
          ),
          Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                children: [
                  const Spacer(),
                  ...List.generate(3, (index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 44, left: 4),
                      child: Container(
                        width: currentIndex == index ? 10 : 6,
                        height: currentIndex == index ? 10 : 6,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                      ),
                    );
                  }),
                  const Spacer(),
                ],
              )),
        ],
      ),
    );
  }
}

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Now showing',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'View All',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/top_gun.png',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const DetailPage(),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/images/dune_poster.jpg',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/northman_poster.jpg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
