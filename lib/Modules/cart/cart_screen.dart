import 'package:ashour/Shared/component/component.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Row(
                  children: [
                    Image.network(
                      'https://www.incimages.com/uploaded_files/image/1920x1080/getty_80116649_344560.jpg',
                      width: 100,
                      height: 80,
                    ),
                    Text('Hi')
                  ],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Expanded(
                  child: CustomButton(
                textColor: Colors.white,
                backgroundColor: Colors.green,
                onPressed: () {},
                child: Text('Check out'),
              )),
              SizedBox(
                width: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10)),
                  height: 30,
                  width: 35,
                  child: Center(child: Text('11')))
            ],
          ),
        ),
      ],
    );

    // const Center(child: Text('Home'));
  }
}
