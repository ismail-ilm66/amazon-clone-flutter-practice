import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10, top: 15),
          alignment: Alignment.topLeft,
          child: const Text(
            'Deal Of The Day',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Image.network(
          'https://images.unsplash.com/photo-1678958274412-563119ec18ab?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=735&q=80',
          height: 235,
          fit: BoxFit.fitHeight,
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, top: 5, right: 40),
          alignment: Alignment.topLeft,
          child: Text('\$1199'),
        ),
        Container(
          padding: const EdgeInsets.only(left: 10, top: 5, right: 40),
          alignment: Alignment.topLeft,
          child: const Text(
            'The Galaxy S23 Ultra is unapologetically big, with a 6.8-inch screen. If the Samsung S22 Ultra was the ultimate evolution of a slab-style smartphone, then the Galaxy S23 Ultra is a victory lap ',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              Image.network(
                'https://images.unsplash.com/photo-1669888940542-bf597f76ef39?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1169&q=80',
                fit: BoxFit.cover,
                height: 100,
                width: 100,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1661268213353-3f7a8b2929cc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=739&q=80',
                fit: BoxFit.cover,
                height: 100,
                width: 100,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1626218174358-7769486c4b79?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1074&q=80',
                fit: BoxFit.cover,
                height: 100,
                width: 100,
              ),
              Image.network(
                'https://images.unsplash.com/photo-1587202372775-e229f172b9d7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80',
                fit: BoxFit.cover,
                height: 100,
                width: 100,
              )
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(top: 15, bottom: 15, left: 10),
          child: Text(
            'See All The Deals',
            style: TextStyle(
              color: Colors.cyan[800],
            ),
          ),
        )
      ],
    );
  }
}
