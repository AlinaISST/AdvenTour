import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

import 'SignIn.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool _isSmallScreen = MediaQuery.of(context).size.width < 800;

    return Scaffold(
        backgroundColor: const Color(0xFFfbf4ea),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Dialog(
              insetPadding: const EdgeInsets.all(22.0),
              alignment: Alignment.center,
              elevation: 10,
              child: Center(
                child: _isSmallScreen ? Column(mainAxisSize: MainAxisSize.min,
                  children: const [
                    SizedBox(height: 20,),
                    _Logo(),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: _ButtonContent(),
                    ),
                  ],
                )
                    : Container(padding: const EdgeInsets.all(32.0), constraints: const BoxConstraints(maxWidth: 1000), child: Row(
                  children: const [
                    Expanded(child: _Logo(),),
                    SizedBox(width: 50,),
                    Expanded(child: Center(child: _ButtonContent()),),
                  ],
                ),),
              ),
            )));
  }
}

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool _isSmallScreen = MediaQuery.of(context).size.width < 600;


    return Column(

      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/icons/character.png", width: _isSmallScreen ? 200 : 300, height: _isSmallScreen ? 200 : 300,),
      ],

    );
  }
}

class _ButtonContent extends StatefulWidget {
  const _ButtonContent({Key? key}) : super(key: key);

  @override
  State<_ButtonContent> createState() => __ButtonContentState();
}

class __ButtonContentState extends State<_ButtonContent> {

  @override
  Widget build(BuildContext context) {
    final bool _isSmallScreen = MediaQuery.of(context).size.width < 600;
    final player = AudioPlayer();
    return Column(
      mainAxisSize: MainAxisSize.min,
      //constraints: const BoxConstraints(maxWidth: 300),
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        const SizedBox(height: 15),
        InkWell(
          child: const Icon(Icons.spatial_audio_off_outlined,
              color: Colors.black54,
              shadows: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 2.0,
                  spreadRadius: 5.0,
                  blurStyle: BlurStyle.outer,
                  //offset: Offset(1.0, 1.0),
                ),
              ]
          ),
          onTap: () {
            player.play(AssetSource("audios/intro-she-masomo.mp3"),);
          },
        ),
        const SizedBox(height: 15,),
        Text("WELCOME! I am Linda. It is really nice to meet you!", style: TextStyle(color: const Color(0xFFe65c00), fontSize: _isSmallScreen ? 18 : 22, fontWeight: FontWeight.w900), textAlign: TextAlign.center,),
        const SizedBox(height: 15,),

        const Text("Glad that you found your way here. This is the She! Masomo application. Here at She! Masomo, we want to inform you about your sexual health, especially focusing on the contraception and the menstrual cycle. \n\nIt is very important to emphasize that the application only gives you options to enable you to have more self-determination and does not force you to take any actions. \n\nDo you want to learn more?", textAlign: TextAlign.justify,),
        const SizedBox(height: 20),
        OutlinedButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const SignIn()));
        },
            child: Text("Next", style: TextStyle(color: const Color(0xFFFFFFFF), fontWeight: FontWeight.w700, fontSize: _isSmallScreen ? 15 : 18),),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFe65c00)),
          ),
        ),

        const SizedBox(height: 15,),
      ],
    );
  }

}