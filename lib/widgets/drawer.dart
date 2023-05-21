import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const imageUrl = "https://media.licdn.com/dms/image/D4D03AQGyxHEeJS34eQ/profile-displayphoto-shrink_800_800/0/1666841602312?e=2147483647&v=beta&t=L3wOjy5Q7nocwhhj-qE2M5-B2gYEFoEPGPVBWCbCHOI";

    return Drawer(
      child: Container(
        color: Colors.deepPurpleAccent,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                 decoration: BoxDecoration(color: Colors.deepPurple),
                  accountName: Text("SI:D"),
                  accountEmail: Text("sid@gmail.com"),
                  //currentAccountPicture: Image.network(imageUrl),
                  currentAccountPicture: CircleAvatar(
                    //radius: 10, //WILL NOT IMPACE, EVEN ON IMAGE.NETWORK, WIDTH/HEIGHT
                    backgroundImage: NetworkImage(imageUrl),
                  )
                  ),
            ),

            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                textScaleFactor: 1.3,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                textScaleFactor: 1.3,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Mail",
                textScaleFactor: 1.3,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


//FLUTTER DOC CONSTRAINTS : CONSTRAINTS GO DOWN, SIZES GO UP, PARENT SETS POSITION.
//WIDGET TREE (IMMUTABLE/REDRAWS EVERY TIME)->ELEMENT TREE(CONTEXT/UPDATES ITSELF)->RENDER TREE(CANVAS DRAWING)