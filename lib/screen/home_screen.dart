import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_request/model/todo.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  void onIndexChange(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List<Todo> todos = [];
  Future fetchTodo() async {
    http.Response request = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/todos"),
    );

    setState(() {
      todos = (jsonDecode(request.body) as List)
          .map(
            (json) => Todo.fromJson(json),
          )
          .toList();
    });
  }

  @override
  void initState() {
    fetchTodo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              margin: EdgeInsets.zero,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        "https://cdn.pixabay.com/photo/2016/09/16/13/52/texture-1674066_960_720.jpg"),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://scontent.fbkk2-6.fna.fbcdn.net/v/t1.0-9/140923824_3418939074883471_3247650883373176364_n.jpg?_nc_cat=109&ccb=1-3&_nc_sid=09cbfe&_nc_eui2=AeHgWqxCS6c3wFOLdWM2iTDAe2QO0LlFoTx7ZA7QuUWhPFSaPV3ruBAmp35Ru1e7u6q781ANoamaeCk2XZnFnkDW&_nc_ohc=Ovd4y43vgasAX-nS3iP&_nc_ht=scontent.fbkk2-6.fna&oh=59266015e7b4fcb14a8b6767bb83acb2&oe=607BC9FA"),
                    ),
                    Text("วัดอุโมง")
                  ],
                ),
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/gallery');
              },
              leading: Icon(Icons.people),
              title: Text("รูปภาพ"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text("Home screen"),
      ),
      body: Container(
        child: ListView(
          children: todos
              .map(
                (item) => Card(
                  child: ListTile(
                    title: Text(
                      item.title,
                    ),
                    subtitle:
                        item.completed ? Text("สำเร็จ") : Text("ไม่สำเร็จ"),
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
