
class User {

  String? token;
  

  User(
      {
      this.token,}
     );

  User.fromJson(Map<String, dynamic> json) {
 
    token = json['token'];
  }

  Map<String, dynamic> toJson(e) {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['token'] = token;
    //data['price'] = price;
   
    return data;
  }
}

