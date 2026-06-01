import 'package:flutter/material.dart';
import 'package:marketi/Features/menu/presentation/view/widget/build_list-title.dart';

class MenuScreen extends StatefulWidget {
   const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  bool isDarkMode = true;

  bool isNotificationOn = true;

  @override
  Widget build(BuildContext context) {
    var height= MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_back, color: Colors.blue),
                ),
                const Text("My Profile", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.shopping_cart_outlined, color: Colors.blue, size: 30),
                ),
              ],
            ),
            SizedBox(height: height*0.02,),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF3B82F6),
                      width: 2.0,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Color(0xFFF1F5F9),
                      backgroundImage: NetworkImage(
                        'https://th.bing.com/th/id/R.95e45a66c918a53280e796b44add2d66?rik=oVKQ59XBdewj8Q&pid=ImgRaw&r=0',
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 4,
                  right: 4,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.add_a_photo_outlined,
                      color: Color(0xFF3B82F6),
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height*0.01,),
            const Text('Yousef Ragab',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF0F172A), letterSpacing: 0.5,),),
            SizedBox(height: height*0.01,),
            const Text('@Nba1Usef', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color(0xFF94A3B8),),),
            SizedBox(height: height*0.02,),
            BuildListTitle(icon: Icons.person_outline, title: "Account Preferences", onTap: (){}),
            SizedBox(height: height*0.01,),
            BuildListTitle(icon: Icons.payment, title: "Subscription & Payment", onTap: (){}),
            SizedBox(height: height*0.01,),
            BuildSwitchTitle(icon: Icons.notifications, title: "App Notifications",
              value: isNotificationOn, onChanged: (value) {
                setState(() => isNotificationOn = value);
              },),
            SizedBox(height: height*0.01,),
            BuildSwitchTitle(icon: Icons.dark_mode_outlined, title: "Dark Mode",
              value: isDarkMode, onChanged: (value) {
                setState(() => isDarkMode = value);
              },),
            SizedBox(height: height*0.01,),
            BuildListTitle(icon: Icons.star, title: "Rate Us", onTap: (){}),
            SizedBox(height: height*0.01,),
            BuildListTitle(icon: Icons.feedback, title: "Provide Feedback", onTap: (){}),
            SizedBox(height: height*0.01,),
            BuildListTitle(icon: Icons.logout, title: "Logout", onTap: (){}),
          ],
        ),
      ),
    );
  }
}
