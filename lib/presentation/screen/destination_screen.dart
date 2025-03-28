import 'package:dest/presentation/bloc/destination_bloc.dart';
import 'package:dest/presentation/bloc/destination_state.dart';
import 'package:dest/presentation/screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DestinationListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Travel Destinations')),
      body: BlocBuilder<DestinationBloc, DestinationState>(
        builder: (context, state) {
          if (state is DestinationLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is DestinationLoaded) {
            return ListView.builder(
              itemCount: state.destinations.length,
              itemBuilder: (context, index) {
                final destination = state.destinations[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image.network(destination['thumbnail'], fit: BoxFit.cover),
                    title: Text(destination['title']),
                    subtitle: Text(destination['description']),
                    trailing: ElevatedButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(destination: destination),
                        ),
                      ),
                      child: Text('View Details'),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('Failed to load destinations.'));
          }
        },
      ),
    );
  }
}