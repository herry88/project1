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
    if(response.statusCode == 200){
      // savePref(res['data']['name'], res['user']['name']);
      print('data : ${res['error']}');
    }

  }
}
