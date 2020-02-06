import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class Users extends StatefulWidget {
  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  List users;     //array list 
  Map datas;
  Future setUser() async{
    String url = "https://reqres.in/api/users";
    http.Response response = await http.get(url);   //reques
    // debugPrint(response.body);

    datas = json.decode(response.body);
    setState(() {
     users = datas['data'];  //convert code
    });
  }
  @override
  void initState(){         //call function
    super.initState();
    setUser();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User information"),
      ),
      body: ListView.builder(
        itemCount:  users == null ? 0 : users.length,  // loop  ||if user = null not loop if user == users.length disply index i
        itemBuilder:(BuildContext contex, int i ){    
          return Container(
            padding : EdgeInsets.all(15.0),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(users[i]["avatar"]),
                ),
                SizedBox(width: 20.0,),
                Text(users[i]["first_name"],style:TextStyle(color: Colors.pink),)
              ],
            ),     
          );
        }
      ),
    );
  }
}
  
