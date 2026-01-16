import 'package:flutter/material.dart';
import 'package:youtube/api.dart';
import 'package:youtube/model/video.dart';


class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  _listVideo(){
    Future<List<Video>> videos;
    
    Api api = Api();
    
    
    return api.pesquisar("");
  }

  @override
  Widget build(BuildContext context) {


    
    
    return FutureBuilder<List<Video>>(
      future: _listVideo(), 
      builder: (context, snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.active:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
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
              Center(
              child: Text("Nenhum dado a ser exibido."),
            );
            }

            break;

        }
        throw '';
      }
      );
    
  }
}
