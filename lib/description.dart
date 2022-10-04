import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/text.dart';

class Description extends StatelessWidget {
  final String name, description, bannerurl, posterurl, launch_on, runtime;

  const Description(
      {super.key,
      required this.name,
      required this.runtime,
      required this.description,
      required this.bannerurl,
      required this.posterurl,
      required this.launch_on});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Container(
            child: ListView(
          children: [
            Container(
              height: 250,
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(
                      bannerurl,
                      fit: BoxFit.cover,
                    ),
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: modified_text(
                  text: name != null ? name : 'Erreur de chargement',
                  size: 30,
                  color: Colors.blue),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: modified_text(
                  text: 'Sortie le -' + launch_on + '      [' + runtime + ']\n',
                  color: Colors.blue,
                  size: 20),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5),
                  height: 200,
                  width: 100,
                  child: Image.network(posterurl),
                ),
                Flexible(
                  child: Container(
                    child: modified_text(
                        text: description, color: Colors.blue, size: 20),
                  ),
                )
              ],
            )
          ],
        )));
  }
}
