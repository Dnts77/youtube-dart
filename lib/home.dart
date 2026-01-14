import 'package:flutter/material.dart';
import 'dart:developer';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Placeholder(
      child: Scaffold(
        appBar: AppBar(
          elevation: 2,
          shadowColor: Colors.black,
          iconTheme: IconThemeData(
            color: Colors.grey,
            opacity: 1
          ),
          backgroundColor: Colors.white,
          title: Image.asset(
            "imgs/youtube.png",
            width: 120,
            height: 22,
            ),
          actions: [
            IconButton(
              onPressed: (){
                log("Ação: VideoCam");
              }, 
              icon: Icon(Icons.videocam)
              ),
            IconButton(
              onPressed: (){
                log("Ação: Pesquisa");
              }, 
              icon: Icon(Icons.search)
              ),
            IconButton(
              onPressed: (){
                log("Ação: Conta");
              }, 
              icon: Icon(Icons.account_circle)
              )
          ],
        ),
        body: Container(),
      ),
    );
  }
}