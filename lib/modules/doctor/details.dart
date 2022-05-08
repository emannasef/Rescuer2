import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../shared/constants.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                Container(
                  width: 200,
                  height: 170,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/person.png',
                        ),
                      )),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'My Name',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.lightBlue),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                // buildItem(title: 'Age', value: '50', lines: 1),

                buildItem(
                    title: 'Address',
                    value: 'Egypt,Mansoura,Sandob ',
                    lines: 1),
                buildItem(title: 'Phone', value: '+201015555596', lines: 1),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30, right: 5),
                          child: Text(
                            'Age',
                            style: TextStyle(
                                color: iconColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Spacer(),
                        const Padding(
                          padding: EdgeInsets.only(right: 25),
                          child: Text('50',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey)),
                        ),
                      ],
                    ),
                  ),
                ),
                buildItem(
                    title: 'Medical History',
                    lines: 3,
                    value:
                        'The heart rate is slow and accompanied by a sharp drop in blood circulation'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildItem(
    {required String title, required String value, required int lines}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[200], borderRadius: BorderRadius.circular(20)),
        // height: 95,
        child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '$title',
                          style: TextStyle(
                              color: iconColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text('$value',
                              maxLines: lines,
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.grey)),
                        )
                      ],
                    ),
                  )
                ]))),
  );
}
