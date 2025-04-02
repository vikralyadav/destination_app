import 'package:dest/presentation/bloc/destination_bloc.dart';
import 'package:dest/presentation/bloc/destination_state.dart';
import 'package:dest/presentation/screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DestinationListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Destinations'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: BlocBuilder<DestinationBloc, DestinationState>(
        builder: (context, state) {
          if (state is DestinationLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is DestinationLoaded) {
            return ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: state.destinations.length,
              itemBuilder: (context, index) {
                final destination = state.destinations[index];
                return Card(
                  elevation: 4.0,
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(destination: destination),
                      ),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.horizontal(left: Radius.circular(12.0)),
                          child: Image.network(
                            destination['thumbnail'],
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  destination['title'],
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  destination['description'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 12.0),
                          child: ElevatedButton(
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(destination: destination),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.teal,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            child: Text('Details'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text(
                'Failed to load destinations.',
                style: TextStyle(fontSize: 16.0, color: Colors.red),
              ),
            );
          }
        },
      ),
    );
  }
}