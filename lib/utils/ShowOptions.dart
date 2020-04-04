import 'package:flutter/material.dart';

class ShowOptions{
  static showManyOptions(TextEditingController tec,BuildContext context,List<String> places)async{
    await showDialog(
      context: context,
      builder:(b){
        return SimpleDialog(
            children: <Widget>[
              Center(
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: places.map((e){
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                                title: Text(e,style: TextStyle(fontStyle: FontStyle.italic,fontSize: 22)),
                                onTap: (){
                                  tec.value=TextEditingValue(text:e);
                                  Navigator.pop(context);}
                            ),
                            if(e!=places[places.length-1])
                              Divider(color: Colors.blueGrey,)

                          ],
                        );}
                      ).toList()
                  )
              ),
            ]);
      },
    );
    // ignore: unrelated_type_equality_checks
  }

}