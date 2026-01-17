import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:youtube/api.dart';
import 'package:youtube/model/video.dart';


// ignore: must_be_immutable
class Inicio extends StatefulWidget {
  

  String pesquisa;

 Inicio(this.pesquisa, {super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

   _listVideo(String pesquisa){
    
    
    Api api = Api();
    
    
    return api.pesquisar(pesquisa);
  }

  @override
  Widget build(BuildContext context) {


    
    
    return FutureBuilder<List<Video>>(
      future: _listVideo(widget.pesquisa), 
      builder: (context, snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none:
            if(snapshot.hasError){
              log("Erro ao carregar vídeos");
            }
            throw '';
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(color: Colors.red,),
            );
            
          case ConnectionState.done:
            if(snapshot.hasData){
              return ListView.separated(
                itemBuilder: (context, index){

                  List<Video> videos = snapshot.data!;
                  Video video = videos[index];

                  return Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(video.imagem!),
                            fit: BoxFit.cover
                            )
                        ),
                      ),
                      ListTile(
                        title: Text(video.titulo!),
                        subtitle: Text(video.canal!),
                      )
                    ],
                  );
                }, 
                separatorBuilder: (context, index) => Divider(
                  height: 2,
                  color: Colors.grey,
                ), 
                itemCount: snapshot.data!.length
                );
            }
            else{
              return Center(
              child: Text("Nenhum dado a ser exibido."),
            );
            }

           

        }
        
      }
      );
    
  }
}
