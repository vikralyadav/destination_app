import 'dart:convert';
import 'package:http/http.dart'as http;

import 'package:flutter_bloc/flutter_bloc.dart';

import 'destination_event.dart';
import 'destination_state.dart';
class DestinationBloc extends Bloc<DestinationEvent, DestinationState> {
  DestinationBloc() : super(DestinationLoading()) {
    on<FetchDestinations>(_onFetchDestinations);
  }
Future<void> _onFetchDestinations(FetchDestinations event, Emitter<DestinationState> emit) async {
    emit(DestinationLoading());
    try {
      final response = await http.get(Uri.parse('https://dummyjson.com/products'));
      final data = json.decode(response.body);
      emit(DestinationLoaded(data['products']));
    } catch (e) {
      emit(DestinationError());
    }
  }
  }