import 'dart:convert';

import 'package:demo/model/data_model.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/subjects.dart';

class GlobalBloc {
  BehaviorSubject<Welcome> get getData => _liveData;
  final BehaviorSubject<Welcome> _liveData = BehaviorSubject<Welcome>();

  Future<Welcome> doFetchData() async {
    final response = await http
        .get(Uri.parse('https://testffc.nimapinfotech.com/testdata.json'));

    if (response.statusCode == 200) {
      try {
        // If the server returns an OK response, parse the JSON
        Map<String, dynamic> data = jsonDecode(response.body);
        var res = Welcome.fromJson(data);
        print(data);
        _liveData.add(res);
        return res;
      } catch (e) {
        throw 'Something went wrong';
      }
    } else {
      throw Exception('Failed to load data');
    }
  }
}

GlobalBloc globalBloc = GlobalBloc();
