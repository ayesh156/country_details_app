import 'dart:convert';

// import 'package:country_app/model/country_data_model.dart';

import 'package:http/http.dart';

import '../model/country_data_model.dart';

class ApiService {

  Future<CountryDataModel> getData({required String name}) async {

    Response response = await get(Uri.parse("https://restcountries.com/v3.1/name/$name"));
    
    if(response.statusCode == 200) {
      Map<String, dynamic> bodyData = jsonDecode(response.body)[0];
      CountryDataModel covidData = CountryDataModel.fromJson(bodyData);
      
      return covidData;

    }else {
      throw Exception(response.statusCode);
    }

  }

}