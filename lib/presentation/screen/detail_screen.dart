import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map destination;
  DetailPage({required this.destination});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(destination['title']),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  destination['thumbnail'],
                  width: double.infinity,
                  height: 250,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Text(
                destination['title'],
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal[800],
                ),
              ),
              SizedBox(height: 12),
              Text(
                destination['description'],
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[700],
                  height: 1.5,
                ),
              ),
              SizedBox(height: 20),
              Divider(color: Colors.grey[400]),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add your booking logic here
                    },
                    icon: Icon(Icons.book_online),
                    label: Text('Book Now'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Add your share logic here
                    },
                    icon: Icon(Icons.share),
                    label: Text('Share'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal[300],
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}