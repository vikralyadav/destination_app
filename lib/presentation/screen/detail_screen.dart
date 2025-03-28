import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map destination;
  DetailPage({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(destination['title'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(destination['thumbnail']),
            SizedBox(height: 16),
            Text(destination['title'], style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text(destination['description']),
          ],
        ),
      ),
    );
  }
}