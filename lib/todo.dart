import "package:flutter/material.dart";

class todo extends StatefulWidget {
  @override
  _todoState createState() => _todoState();
}

class _todoState extends State<todo> {
  var output = "";
  List<dynamic> lst = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          "TODO",
          style: TextStyle(
              color: Colors.blue[500],
              fontSize: 25,
              fontFamily: "Halvetica",
              fontWeight: FontWeight.w900),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      
             
            leading:  Icon(
                Icons.alarm_add_rounded,
                size: 25,
                
                color: Colors.blue,
              )
            ),
        body: ListView.builder(
            
            itemCount: lst.length,
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Container(
                
                  
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.blue,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0), //(x,y)
                      blurRadius: 6.0,)]),
                  // semanticContainer: true,
                  // elevation: 1,
                  // clipBehavior: Clip.antiAliasWithSaveLayer,
                  // shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  
                  child: ListTile(
                    title: Text(
                      "${lst[index]}",
                      style: TextStyle(color: Colors.white),
                    ),
                    
                    trailing: Container(
                      width: 50,
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text("Edit Item"),
                                        content: TextField(
                                          onChanged: (value) {
                                            output = value;
                                          },
                                        ),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  lst.replaceRange(
                                                      index, index + 1, {output});
                                                });
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Edit"))
                                        ],
                                      );
                                    });
                              },
                              child: Icon(
                                Icons.edit,size: 20,
                                color: Colors.white,
                              )),
                           SizedBox(width: 4,)  , 
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  lst.removeAt(index);
                                });
                              },
                              child: Icon(
                                Icons.delete,size: 20,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Add Item"),
                    content: TextField(
                      onChanged: (value) {
                        output = value;
                      },
                    ),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            setState(() {
                              lst.add(output);
                            });
                            Navigator.of(context).pop();
                          },
                          child: Text("Add"))
                    ],
                  );
                });
          },
          child: Icon(Icons.add),
        ));
  }
}
