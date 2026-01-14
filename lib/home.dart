import 'package:flutter/material.dart';
import 'package:youtube/screens/biblioteca.dart';
import 'package:youtube/screens/em_alta.dart';
import 'dart:developer';
import 'package:youtube/screens/inicio.dart';
import 'package:youtube/screens/inscricao.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [Inicio(), EmAlta(), Inscricao(), Biblioteca()];

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        shadowColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.grey, opacity: 1),
        backgroundColor: Colors.white,
        title: Image.asset("imgs/youtube.png", width: 120, height: 22),
        actions: [
          IconButton(
            onPressed: () {
              log("Ação: VideoCam");
            },
            icon: Icon(Icons.videocam),
          ),
          IconButton(
            onPressed: () {
              log("Ação: Pesquisa");
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              log("Ação: Conta");
            },
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
      body: telas[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 2,
        fixedColor: Colors.red,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            //backgroundColor: Colors.orange,
            label: "Início",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.red,
            label: "Em alta",
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.blue,
            label: "Inscrições",
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            //backgroundColor: Colors.green,
            label: "Biblioteca",
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}
