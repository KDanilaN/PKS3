import 'package:flutter/material.dart';
import 'package:pks_3/models/microphone.dart';
import 'package:pks_3/pages/item_page.dart';

class StoreItem extends StatelessWidget {
  final Microphone microphone;

  const StoreItem({super.key, required this.microphone});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemPage(microphone: microphone),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.all(10),
        color: const Color.fromRGBO(102, 155, 188, 1),
        child: Column(
          children: [
            Image.asset(
              microphone.image,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            ListTile(
              title: Text(
                microphone.name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                '${microphone.price} \$',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                microphone.info,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Частотный диапазон: ${microphone.frequencyResponse}\nПолярный паттерн: ${microphone.polarPattern}',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}