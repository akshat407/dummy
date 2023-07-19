import 'package:flutter/material.dart';
import 'package:whiteboard/whiteboard.dart';

class post_screen extends StatefulWidget {
  @override
  _WhiteboardScreenState createState() => _WhiteboardScreenState();
}

class _WhiteboardScreenState extends State<post_screen> {
WhiteBoardController controller=WhiteBoardController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Whiteboard'),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Expanded(
                child: WhiteBoard(
                  controller: WhiteBoardController(),
                  strokeColor: Colors.black,
                  isErasing: false,
                  
                ),
                
              ),
              TextButton(onPressed: (){
                controller.clear();
              }, child: Text('clear'))
            ],
          ),
        ),
      );
  }
}