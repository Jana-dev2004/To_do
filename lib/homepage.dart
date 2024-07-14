import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'components/todo.dart';
class Homepage extends StatefulWidget {
   Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final TextEditingController _controller=TextEditingController();
  List items=[
    ["Learn Flutter",false],
    ["Learn Figma",false],
  ];
  void checkbox(index)
  {
    setState(() {
       items[index][1]=!items[index][1];
    });
    
  }
  void newitem()
  {
    setState(() {
    items.add([_controller.text,false]);
    });
  }
  void deletetask(int index)
  {
    setState(() {
      items.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 161, 124, 224),
      appBar: AppBar(

        title:const Text("To do"),
        backgroundColor: const Color.fromARGB(255, 148, 98, 233),
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView.builder(itemCount: items.length,itemBuilder:(context,index)
      {
        return Todo(
          taskname:items[index][0],
          taskcompleted: items[index][1],
          onChanged:(value)=>checkbox(index),
          deleteFunction: (context)=>deletetask(index),
        );
      }),
      floatingActionButton: Row(
        children: [
          Expanded(child:Padding(
            padding: const EdgeInsets.only(left:20,right:10),
            child: TextField(
              controller: _controller,
              decoration:InputDecoration(
                filled: true,
                fillColor: const Color.fromARGB(255, 144, 133, 163),
                focusedBorder: OutlineInputBorder(
                  borderSide:BorderSide(
                    color:Colors.white,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide:BorderSide(
                    color:Colors.white,
                  ),
                ),
              ),
            ),
  
          )),
          FloatingActionButton(onPressed:newitem,child: Icon(Icons.add),),
        ],
      ),
    );
  }
}