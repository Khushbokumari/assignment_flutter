import 'package:flutter/material.dart';

class User {
  final String name;
  final String title;
  final String address;
  final String email;
  final String phone;
  final String image;

  User({
    required this.name,
    required this.title,
    required this.address,
    required this.email,
    required this.phone,
    required this.image,
  });
}

class ListPages extends StatefulWidget {
  @override
  _ListPagesState createState() => _ListPagesState();
}

class _ListPagesState extends State<ListPages> {
  // var imgList = [
  //   "assets/images/img1.jpg",
  //   "assets/images/img2.jpg",
  //   "assets/images/img3.jpg",
  //   "assets/images/img4.jpg",
  //   "assets/images/img5.jpg",
  //   "assets/images/img6.jpg",
  //   "assets/images/img7.jpg"
  // ];
  var userList = [
    User(
      name: "John Doe",
      title: "Software Engineer",
      address: "123 Main St, City",
      email: "john.doe@example.com",
      phone: "+123 456 7890",
      image: "assets/images/img1.jpg",
    ),
    User(
      name: "JoDoe",
      title: "Software Engineer",
      address: "123 Main St, City",
      email: "john.doe@example.com",
      phone: "+123 456 7890",
      image: "assets/images/img2.jpg",
    ),
    User(
      name: "J Doe",
      title: "Software Engineer",
      address: "123 Main St, City",
      email: "john.doe@example.com",
      phone: "+123 456 7890",
      image: "assets/images/img3.jpg",
    ),
    User(
      name: " Doe",
      title: "Software Engineer",
      address: "123 Main St, City",
      email: "john.doe@example.com",
      phone: "+123 456 7890",
      image: "assets/images/img4.jpg",
    ),
    User(
      name: "John Doe",
      title: "Software Engineer",
      address: "123 Main St, City",
      email: "john.doe@example.com",
      phone: "+123 456 7890",
      image: "assets/images/img5.jpg",
    ),
    // Add more users here
    // ...
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "User List",
          style: TextStyle(color: Colors.grey),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailsPage(user: userList[index]),
                ),
              );
            },
            child: Card(
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(userList[index].image),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          userList[index].name,
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: width,
                          child: Text(
                            userList[index].title,
                            maxLines: 3,
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class UserDetailsPage extends StatelessWidget {
  final User user;

  UserDetailsPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                user.image,
                width: 200,
                height: 200,
              ),
              SizedBox(height: 20),
              Text(
                user.name,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Title: ${user.title}",
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Text(
                "Address: ${user.address}",
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Text(
                "Email: ${user.email}",
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 5),
              Text(
                "Phone: ${user.phone}",
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
