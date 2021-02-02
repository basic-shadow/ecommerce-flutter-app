import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.all(18.0),
            child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 38,
                          width: 38,
                          margin: const EdgeInsets.only(bottom: 20.0),
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Material(
                            type: MaterialType.transparency,
                            child: IconButton(
                              iconSize: 22,
                              splashColor: Colors.teal[400],
                              icon: Icon(Icons.arrow_back,
                                  color: Colors.blueGrey[700]),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ),
                        ),
                        Container(
                          margin:
                              const EdgeInsets.only(left: 20.0, bottom: 20.0),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Settings",
                            style: TextStyle(fontSize: 22.0),
                          ),
                        ),
                      ],
                    ),
                    Container(
                        margin: const EdgeInsets.only(bottom: 22.0),
                        padding: EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 3.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.search),
                            Expanded(
                              child: TextField(
                                controller: textController,
                                maxLines: 1,
                                decoration: InputDecoration(
                                    hintText: "Search Settings",
                                    contentPadding: EdgeInsets.all(15.0),
                                    border: InputBorder.none),
                              ),
                            )
                          ],
                        )),
                    rowSettings("Profile Settings",
                        Icons.phone_android_outlined, context),
                    rowSettings("Shipping Address",
                        Icons.local_shipping_outlined, context),
                    rowSettings(
                        "Currency", Icons.attach_money_outlined, context),
                    rowSettings("Language", Icons.language_outlined, context),
                    Divider(thickness: 3.0),
                    rowSettings("Notifications",
                        Icons.notifications_active_outlined, context),
                    rowSettings("Rate Application", Icons.rate_review_outlined,
                        context),
                    rowSettings(
                        "Privacy Policy", Icons.privacy_tip_outlined, context),
                    rowSettings("FAQ", Icons.menu_book_outlined, context),
                    Divider(thickness: 3.0),
                    SizedBox(height: 15.0),
                    FlatButton(
                      minWidth: _width / 1.2,
                      color: Colors.red[400],
                      onPressed: () => Navigator.of(context)
                          .pushNamedAndRemoveUntil(
                              '/login', (Route<dynamic> route) => false),
                      child: Text(
                        "Log Out",
                        style:
                            TextStyle(color: Colors.grey[100], fontSize: 15.0),
                      ),
                    )
                  ],
                ))),
      ),
    );
  }
}

Widget rowSettings(String text, IconData icon, BuildContext context) {
  return InkWell(
    onTap: () => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        contentPadding: EdgeInsets.only(left: 25.0, right: 25.0, top: 35.0),
        content: Text("Clicked $text"),
        actions: [
          FlatButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          )
        ],
      ),
    ),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 32.0,
            color: Colors.teal[700],
          ),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.0),
                  child: Text(
                    text,
                    style: TextStyle(fontSize: 16.0, color: Colors.black87),
                  ))),
        ],
      ),
    ),
  );
}
