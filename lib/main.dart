import 'package:dest/presentation/bloc/destination_bloc.dart';
import 'package:dest/presentation/bloc/destination_event.dart';
import 'package:dest/presentation/screen/destination_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Destinations',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => DestinationBloc()..add(FetchDestinations()),
        child: DestinationListPage(),
      ),
    );
  }
}