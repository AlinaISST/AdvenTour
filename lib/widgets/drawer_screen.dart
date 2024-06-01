import 'package:explore_era/Notifier/user.notifier.dart';
import 'package:explore_era/Screens/home_page.dart';
import 'package:explore_era/Screens/sign_in.dart';
import 'package:explore_era/Screens/ticket_booking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserNotifier userNotifier =
        Provider.of<UserNotifier>(context, listen: false);
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Color(0xFF29395B),
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  spreadRadius: 3.0,
                  blurRadius: 5.0,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),
            accountName: Text(
              userNotifier.user.userName ?? "",
              style: GoogleFonts.raleway(
                fontSize: 15,
                color: const Color(0xffFFFFFF),
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundColor: const Color(0xFF29395B),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(300.0),
                child: Image.asset(
                  "assets/images/boy.png",
                ),
              ),
            ),
            accountEmail: null,
          ),
          // ListTile(
          //   dense: true,
          //   leading: const Icon(
          //     Icons.login_outlined,
          //     color: Colors.black54,
          //     shadows: [
          //       BoxShadow(
          //         color: Colors.black38,
          //         blurRadius: 1.0,
          //         spreadRadius: 10.0,
          //         blurStyle: BlurStyle.outer,
          //       ),
          //     ],
          //   ),

          //   title: const Text(
          //     'Log In',
          //     style: TextStyle(
          //       shadows: [
          //         BoxShadow(
          //           color: Colors.black38,
          //           blurRadius: 1.0,
          //           spreadRadius: 10.0,
          //           blurStyle: BlurStyle.outer,
          //         ),
          //       ],
          //     ),
          //   ),
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //         builder: (context) => const SignIn(),
          //       ),
          //     );
          //   },
          //   //selected: true,
          // ),
          ListTile(
            dense: true,
            leading: const Icon(
              Icons.account_circle_outlined,
              color: Colors.black54,
              shadows: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 1.0,
                  spreadRadius: 10.0,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),

            title: const Text(
              'Ticket Booking',
              style: TextStyle(
                shadows: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 1.0,
                    spreadRadius: 10.0,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const TicketBooking(),
                ),
              );
            },
            //selected: true,
          ),
          ListTile(
            dense: true,
            leading: const Icon(
              Icons.mark_email_unread_outlined,
              color: Colors.black54,
              shadows: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 1.0,
                  spreadRadius: 10.0,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            title: const Text(
              'Messages',
              style: TextStyle(
                shadows: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 1.0,
                    spreadRadius: 10.0,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            dense: true,
            leading: const Icon(
              Icons.settings,
              color: Colors.black54,
              shadows: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 1.0,
                  spreadRadius: 10.0,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            title: const Text(
              'Settings',
              style: TextStyle(
                shadows: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 1.0,
                    spreadRadius: 10.0,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            dense: true,
            leading: const Icon(
              Icons.logout_outlined,
              color: Colors.black54,
              shadows: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 1.0,
                  spreadRadius: 10.0,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            title: const Text(
              'Logout',
              style: TextStyle(
                shadows: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 1.0,
                    spreadRadius: 10.0,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                CupertinoPageRoute(
                  builder: (context) => const SignIn(),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            dense: true,
            leading: const Icon(
              Icons.info_outline_rounded,
              color: Colors.black54,
              shadows: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 1.0,
                  spreadRadius: 10.0,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            title: const Text(
              'About Us',
              style: TextStyle(
                shadows: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 1.0,
                    spreadRadius: 10.0,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()));
            },
          ),
          ListTile(
            dense: true,
            leading: const Icon(
              Icons.perm_contact_cal_outlined,
              color: Colors.black54,
              shadows: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 1.0,
                  spreadRadius: 10.0,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            title: const Text(
              'Contact Us',
              style: TextStyle(
                shadows: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 1.0,
                    spreadRadius: 10.0,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()));
            },
          ),
          ListTile(
            dense: true,
            leading: const Icon(
              Icons.verified_outlined,
              color: Colors.black54,
              shadows: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 1.0,
                  spreadRadius: 10.0,
                  blurStyle: BlurStyle.outer,
                ),
              ],
            ),
            title: const Text(
              'Version 1.0.0',
              style: TextStyle(
                shadows: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 1.0,
                    spreadRadius: 10.0,
                    blurStyle: BlurStyle.outer,
                  ),
                ],
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
