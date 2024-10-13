import 'package:flutter/material.dart';

import '../Wedget/tabpar.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(12.0),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
          ),
          title: Center(
            child: Text(
              'data',
              style: TextStyle(color: Colors.black),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.notifications_none_sharp))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image(
                          image: AssetImage(
                              'assets/imagesFood/ca-times.brightspotcdn.jpg')),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'New recipe',
                            style: TextStyle(color: Colors.white, fontSize: 28),
                          ),
                          Text(
                            'When you order \$20+\n'
                            'Automatically applied.',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(height: 20,),
                          Container(
                            height: 38,width: 120,
                            decoration: BoxDecoration(

                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Center(
                              child: Text(
                                'Order now',
                                style: TextStyle(color: Colors.black,fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Search Food,groceries',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    prefixIcon: Icon(Icons.search_rounded,
                        size: 42, color: Colors.black),
                  ),
                  style:
                      TextStyle(color: Colors.black), // هنا يمكنك تغيير اللون
                ),
              ),
              TabBarPage(),
            ],
          ),
        ));
  }
}
