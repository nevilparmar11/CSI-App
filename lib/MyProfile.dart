import 'package:flutter/material.dart';


const Color theme_color = Color(0xFF13182B);
const Color bg_color = Color(0xFFF6C753);

Center MyProfile(String profileName, String jobDescription, String location,
    String weblink) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(width: 10, color: theme_color),
        ),
        // gradient: LinearGradient(
        //      colors: [Colors.red, Colors.redAccent],
        //    begin: Alignment.centerRight,
        //  end: Alignment(-1.0, -1.0))),
        child: Container(
          width: 500,
          height: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.tealAccent[50]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Text(
                      profileName,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      jobDescription,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.my_location,
                                color: theme_color,
                                size: 25,
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                location,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      ": Contact Details :",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Email : nevilparmar24@gmail.com",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(
                      "Mobile : 7600616919",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Positioned myImage(String imagePath) {
  return Positioned(
    top: 0.0,
    left: 110,
    child: Container(
      width: 160,
      height: 160,
      decoration: BoxDecoration(
          border: Border.all(width: 5, color: theme_color),
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.fill, image: new AssetImage(imagePath))),
    ),
  );
}
