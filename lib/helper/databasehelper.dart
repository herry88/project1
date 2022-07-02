import 'dart:convert';

import 'package:http/http.dart' as http;

class DBHelper {
  var status;
  //login
  loginData(String email, String password) async {
    //ini adalah url
    String myUrl = 'https://backendapilaravel-app.herokuapp.com/';
    //ini adalah data yang akan dikirimkan
    final response = await http.post(Uri.parse(myUrl), headers: {
      'Accept': 'application/json',
    }, body: {
      "email": "$email",
      "password": "$password",
    });
    status = response.body.contains('error');
    var res = json.decode(response.body);
    if (response.statusCode == 200) {
      // savePref(res['data']['name'], res['user']['name']);
      print('data : ${res['error']}');
    }
  }

  //addData
  void addData(String nmproduct, String stock) async {
    String myUrl = 'https://backendapilaravel-app.herokuapp.com/api/product';
    http.post(Uri.parse(myUrl), headers: {
      'Accept': 'application/json',
    }, body: {
      "nmproduct": nmproduct,
      "stock": stock.toString(),
    }).then((response) {
      print('status : ${response.statusCode}');
      print('body : ${response.body}');
    });
  }

  //get data
  Future<List> getData() async {
    String myUrl = 'https://backendapilaravel-app.herokuapp.com/api/product';
    http.Response response = await http.get(Uri.parse(myUrl), headers: {
      'Accept': 'application/json',
    });
    return json.decode(response.body)['data'];
  }

  //editData
  void editData(int id, String nmproduct, String stock) async {
    String myUrl =
        'https://backendapilaravel-app.herokuapp.com/api/product/$id';
    http.put(Uri.parse(myUrl), headers: {
      'Accept': 'application/json',
    }, body: {
      'nmproduct': nmproduct,
      'stock': stock.toString(),
    }).then((response) {
      print('Status: ${response.statusCode}');
      print('body: ${response.body}');
    });
  }

  //delete data
  void deleteData(int id) async {
    String myUrl =
        'https://backendapilaravel-app.herokuapp.com/api/product/$id';
    http.delete(
      Uri.parse(myUrl),
      headers: {
        'Accept': 'application/json',
      },
    ).then((response) {
      print('delete : ${response.body}');
    });
  }
}
