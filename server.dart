import 'dart:convert';

import 'package:http/http.dart' as http;
class Server{
  void loadUrl()async {
    // this code can be executed from floating action button in main.dart file.
    final res = await http.get(Uri.parse('http://20.244.56.144/numbers/primes'));
    final res2=await http.get(Uri.parse('http://20.244.56.144/numbers/fibo'));
    final res3=await http.get(Uri.parse('http://20.244.56.144/numbers/odd'));
    // final res4=await http.get(Uri.parse('http://20.244.56.144/numbers/rand'));
    List urls=[];


    final mp = jsonDecode(res.body);
    urls=mp['numbers'];
    urls.addAll(jsonDecode(res2.body)['numbers']);
    urls.addAll(jsonDecode(res3.body)['numbers']);
    // urls.addAll(jsonDecode(res4.body)['numbers']);

    urls=urls.toSet().toList();
    urls.sort();

    print(urls);
    
    print(mp.runtimeType);
  }
}