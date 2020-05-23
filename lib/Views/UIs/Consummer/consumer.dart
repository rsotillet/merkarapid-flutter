import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:merkarapid/utils/providers/push_notifications_provider.dart';

class Consumer extends StatefulWidget{

  @override
  _ConsumerState createState( )=> new _ConsumerState();

}

class _ConsumerState extends State<Consumer>{


  String subtitle;
  PageController _controllerViewer;
  Color auxiliaryColor;

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);
    subtitle="Categorias";
    _controllerViewer =PageController(
      initialPage: 0,
    );
    auxiliaryColor=Colors.grey;
    final pushProvider = new PushNotificationProvider();
    pushProvider.initNotifications();
    pushProvider.messages.listen((argument){
      print("Argumento=====================================================================");
      print(argument);
      //showNotify(argument);
    });
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        if(subtitle!=''){
          await _controllerViewer.animateToPage(0, duration: Duration(seconds: 1),curve: Curves.ease);
          setState(() {
            subtitle='';
          });
          return false;
        }
        return true;
      },
      child: Scaffold(
        drawer: _buildDrawer(),
        body: _buildBody(),
      ),
    );
  }



  _buildDrawer(){
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Ronny Sotillet',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 16.0),),
            accountEmail: Text('ronny.sotillet777@gmail.com',style: TextStyle(color: Colors.white),),
            currentAccountPicture:Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/perfil1.png')
                    )
                )
            ) ,
            decoration: BoxDecoration(
                gradient:  LinearGradient(
                    colors:  <Color>[
                      Color.fromRGBO(244, 111, 51, 1),
                      Color.fromRGBO(255, 149, 2, 1),
                    ]),
            ),
          ),
          Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors:  <Color>[
                      Color.fromRGBO(244, 111, 51, 1),
                      Color.fromRGBO(255, 149, 2, 1),
                    ])
            ),
            child: ListTile(
              title: Text('Cuenta', style: TextStyle(color: Colors.white),),
              leading: Icon(Icons.account_box, color: Colors.white,),
              onTap:() {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/profileConsummer');
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors:  <Color>[
                      Color.fromRGBO(244, 111, 51, 1),
                      Color.fromRGBO(255, 149, 2, 1),
                    ])
            ),
            child: ListTile(
              title: Text('Mis Pedidos', style: TextStyle(color: Colors.white),),
              leading: Icon(Icons.shopping_basket, color: Colors.white,),
              onTap:() {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/orderConsummer');
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors:  <Color>[
                      Color.fromRGBO(244, 111, 51, 1),
                      Color.fromRGBO(255, 149, 2, 1),
                    ])
            ),
            child: ListTile(
              title: Text('Mis Direcciones', style: TextStyle(color: Colors.white),),
              leading: Icon(Icons.location_on, color: Colors.white,),
              onTap:() {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/directions');
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors:  <Color>[
                      Color.fromRGBO(244, 111, 51, 1),
                      Color.fromRGBO(255, 149, 2, 1),
                    ])
            ),
            child: ListTile(
              title: Text('Adquiere tu SOAT', style: TextStyle(color: Colors.white),),
              leading: Icon(Icons.directions_car, color: Colors.white,),
              onTap:() {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/soat');
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors:  <Color>[
                      Color.fromRGBO(244, 111, 51, 1),
                      Color.fromRGBO(255, 149, 2, 1),
                    ])
            ),
            child: ListTile(
              title: Text('Atencion al cliente', style: TextStyle(color: Colors.white),),
              leading: Icon(Icons.help, color: Colors.white,),
              onTap:() {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/contact');
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors:  <Color>[
                      Color.fromRGBO(244, 111, 51, 1),
                      Color.fromRGBO(255, 149, 2, 1),
                    ])
            ),
            child: ListTile(
              title: Text('Informacion Legal', style: TextStyle(color: Colors.white),),
              leading: Icon(Icons.info, color: Colors.white,),
              onTap:() {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/tyc');
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Ink(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors:  <Color>[
                      Color.fromRGBO(244, 111, 51, 1),
                      Color.fromRGBO(255, 149, 2, 1),
                    ])
            ),
            child: ListTile(
              title: Text('Cerrar sesion', style: TextStyle(color: Colors.white),),
              leading: Icon(Icons.close, color: Colors.white,),
              onTap:() {
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/');
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Center(
            child:Container(
                width: 150.0,
                height: 100.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/fromAmsoft.png')
                    )
                )
            ),
          )
        ],
      ),
    );
  }



  _buildBody(){
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled ){
        return <Widget>[
          SliverAppBar(
            title:Text("Menu Principal"),
            actions: <Widget>[
              IconButton(color: Colors.white,icon: Icon(Icons.search),onPressed: (){},),
              IconButton(color: Colors.white,icon: Icon(Icons.shopping_cart),onPressed: (){Navigator.pushNamed(context, '/shoppingCar');},),
            ],
            backgroundColor: Color.fromRGBO(244, 111, 51, 1),
            //expandedHeight: MediaQuery.of(context).size.height,
            expandedHeight: MediaQuery.of(context).size.height/3,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        gradient:  LinearGradient(
                            colors:  <Color>[
                              Color.fromRGBO(244, 111, 51, 1),
                              Color.fromRGBO(255, 149, 2, 1),

                            ],
                          begin:  Alignment.topLeft,
                          end: Alignment.bottomRight,),
                        image: DecorationImage(
                            image: AssetImage('assets/bg-vf4.png'),
                            //colorFilter: ColorFilter.mode(Color.fromRGBO(255, 149, 2, 1), BlendMode.multiply),
                            fit: BoxFit.cover
                        )
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Center(
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Image(
                            image: AssetImage('assets/merkarapid-oficial-w.png'),
                            width: 200.0,
                            height: 200.0,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ];
      },
      body: Container(
        decoration: BoxDecoration(
          //color: Colors.white,
        ),
        child: PageView(
          controller: _controllerViewer,
          physics:NeverScrollableScrollPhysics(),
          children: <Widget>[
            ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Categorias',style: TextStyle(color: Colors.grey,fontSize: 26.0),)
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Material(
                              child: Container(
                                width: MediaQuery.of(context).size.width-10.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage('assets/frutas.png'),
                                        alignment: Alignment.topRight
                                    ),
                                    //color: Color.fromRGBO(9,173,120, 1),
                                    color: Color.fromRGBO(247,88,89, 1),//gris
                                    //color: Color.fromRGBO(255,149,2,1),
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                child: FlatButton(
                                  onPressed: (){
                                    setState(() {
                                      auxiliaryColor=Color.fromRGBO(247,88,89, 1);
                                      subtitle='Frutas';
                                      _controllerViewer.animateToPage(1, duration: Duration(seconds: 1),curve: Curves.ease);

                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 30,bottom: 30,left: 5.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:<Widget>[
                                              Text("Frutas",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                                            ]
                                        ),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:<Widget>[
                                              Text("Productos Agricolas",style: TextStyle(color: Colors.white,fontSize: 12.0),),
                                            ]
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ),
                      ],
                    ),
                    //Verduras,lacteos,Harinas,Carnes
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Material(
                              child: Container(
                                width: MediaQuery.of(context).size.width-10.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage('assets/verduras.png'),
                                        alignment: Alignment.topRight
                                    ),
                                    //color: Color.fromRGBO(9,173,120, 1),
                                    color: Color.fromRGBO(160,217,149, 1),//gris
                                    //color: Color.fromRGBO(255,149,2,1),
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                child: FlatButton(
                                  onPressed: (){
                                    setState(() {
                                      auxiliaryColor=Color.fromRGBO(160,217,149, 1);
                                      subtitle='Verduras';
                                      _controllerViewer.animateToPage(1, duration: Duration(seconds: 1),curve: Curves.ease);
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 30,bottom: 30,left: 5.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:<Widget>[
                                              Text("Verduras",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                                            ]
                                        ),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:<Widget>[
                                              Text("Productos Agricolas",style: TextStyle(color: Colors.white,fontSize: 12.0),),
                                            ]
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Material(
                              child: Container(
                                width: MediaQuery.of(context).size.width-10.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage('assets/flores.png'),
                                        alignment: Alignment.center
                                    ),
                                    //color: Color.fromRGBO(9,173,120, 1),
                                    color: Color.fromRGBO(255,168,184, 1),//gris
                                    //color: Color.fromRGBO(255,149,2,1),
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                child: FlatButton(
                                  onPressed: (){
                                    setState(() {
                                      auxiliaryColor=Color.fromRGBO(255,168,184, 1);
                                      _controllerViewer.animateToPage(1, duration: Duration(seconds: 1),curve: Curves.ease);
                                      subtitle='Flores';
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 30,bottom: 30,left: 5.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:<Widget>[
                                              Text("Flores",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                                            ]
                                        ),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:<Widget>[
                                              Text("Productos Agricolas",style: TextStyle(color: Colors.white,fontSize: 12.0),),
                                            ]
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Material(
                              child: Container(
                                width: MediaQuery.of(context).size.width-10.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage('assets/carnes.png'),
                                        alignment: Alignment.topRight
                                    ),
                                    //color: Color.fromRGBO(9,173,120, 1),
                                    color: Color.fromRGBO(232,186,134, 1),//gris
                                    //color: Color.fromRGBO(255,149,2,1),
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                child: FlatButton(
                                  onPressed: (){
                                    setState(() {
                                      auxiliaryColor=Color.fromRGBO(232,186,134, 1);
                                      subtitle='Carnes';
                                      _controllerViewer.animateToPage(1, duration: Duration(seconds: 1),curve: Curves.ease);
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 30,bottom: 30,left: 5.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:<Widget>[
                                              Text("Carnes",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                                            ]
                                        ),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:<Widget>[
                                              Text("Productos Cárnicos",style: TextStyle(color: Colors.white,fontSize: 12.0),),
                                            ]
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Material(
                              child: Container(
                                width: MediaQuery.of(context).size.width-10.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage('assets/granos.png'),
                                        alignment: Alignment.bottomRight
                                    ),
                                    //color: Color.fromRGBO(9,173,120, 1),
                                    color: Color.fromRGBO(188,206,244, 1),//gris
                                    //color: Color.fromRGBO(255,149,2,1),
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                child: FlatButton(
                                  onPressed: (){
                                    setState(() {
                                      auxiliaryColor=Color.fromRGBO(188,206,244, 1);
                                      subtitle='Granos';
                                      _controllerViewer.animateToPage(1, duration: Duration(seconds: 1),curve: Curves.ease);
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 30,bottom: 30,left: 5.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:<Widget>[
                                              Text("Granos",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                                            ]
                                        ),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:<Widget>[
                                              Text("Abarrotes",style: TextStyle(color: Colors.white,fontSize: 12.0),),
                                            ]
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Material(
                              child: Container(
                                width: MediaQuery.of(context).size.width-10.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage('assets/dulces.png')
                                    ),
                                    //color: Color.fromRGBO(9,173,120, 1),
                                    color: Color.fromRGBO(250,225,135, 1),//gris
                                    //color: Color.fromRGBO(255,149,2,1),
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                child: FlatButton(
                                  onPressed: (){
                                    setState(() {
                                      auxiliaryColor=Color.fromRGBO(250,225,135, 1);
                                      subtitle='Dulces';
                                      _controllerViewer.animateToPage(1, duration: Duration(seconds: 1),curve: Curves.ease);

                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 30,bottom: 30,left: 5.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:<Widget>[
                                              Text("Dulces",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                                            ]
                                        ),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:<Widget>[
                                              Text("Abarrotes",style: TextStyle(color: Colors.white,fontSize: 12.0),),
                                            ]
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Material(
                              child: Container(
                                width: MediaQuery.of(context).size.width-10.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage('assets/comida-rapida.png'),
                                        alignment: Alignment.topRight
                                    ),
                                    //color: Color.fromRGBO(9,173,120, 1),
                                    color: Color.fromRGBO(197,208,132, 1),//gris
                                    //color: Color.fromRGBO(255,149,2,1),
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                child: FlatButton(
                                  onPressed: (){
                                    setState(() {
                                      auxiliaryColor=Color.fromRGBO(197,208,132, 1);
                                      subtitle='Comidas Rapidas';
                                      _controllerViewer.animateToPage(1, duration: Duration(seconds: 1),curve: Curves.ease);
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 30,bottom: 30,left: 5.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:<Widget>[
                                              Text("Comidas Rapidas",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                                            ]
                                        ),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:<Widget>[
                                              Text("Alimentos",style: TextStyle(color: Colors.white,fontSize: 12.0),),
                                            ]
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Material(
                              child: Container(
                                width: MediaQuery.of(context).size.width-10.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage('assets/mascotas.png'),
                                        alignment: Alignment.bottomRight
                                    ),
                                    //color: Color.fromRGBO(9,173,120, 1),
                                    color: Color.fromRGBO(220,217,248, 1),//gris
                                    //color: Color.fromRGBO(255,149,2,1),
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                child: FlatButton(
                                  onPressed: (){
                                    setState(() {
                                      auxiliaryColor=Color.fromRGBO(220,217,248, 1);
                                      subtitle='productos para Mascotas';
                                      _controllerViewer.animateToPage(1, duration: Duration(seconds: 1),curve: Curves.ease);

                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 30,bottom: 30,left: 5.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:<Widget>[
                                              Text("Mascotas",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                                            ]
                                        ),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:<Widget>[
                                              Text("Alimentos",style: TextStyle(color: Colors.white,fontSize: 12.0),),
                                            ]
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Material(
                              child: Container(
                                width: MediaQuery.of(context).size.width-10.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage('assets/harinas.png'),
                                        alignment: Alignment.bottomRight
                                    ),
                                    //color: Color.fromRGBO(9,173,120, 1),
                                    color: Color.fromRGBO(169,229,227, 1),//gris
                                    //color: Color.fromRGBO(255,149,2,1),
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                child: FlatButton(
                                  onPressed: (){
                                    setState(() {
                                      auxiliaryColor=Color.fromRGBO(169,229,227, 1);
                                      subtitle='Harinas';
                                      _controllerViewer.animateToPage(1, duration: Duration(seconds: 1),curve: Curves.ease);
                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 30,bottom: 30,left: 5.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:<Widget>[
                                              Text("Harinas",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                                            ]
                                        ),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:<Widget>[
                                              Text("Mercado Campesino",style: TextStyle(color: Colors.white,fontSize: 12.0),),
                                            ]
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Material(
                              child: Container(
                                width: MediaQuery.of(context).size.width-10.0,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage('assets/ropa.png'),
                                        alignment: Alignment.bottomRight
                                    ),
                                    //color: Color.fromRGBO(9,173,120, 1),
                                    color: Color.fromRGBO(210,200,151, 1),//gris
                                    //color: Color.fromRGBO(255,149,2,1),
                                    borderRadius: BorderRadius.all(Radius.circular(10.0))
                                ),
                                child: FlatButton(
                                  onPressed: (){
                                    setState(() {
                                      auxiliaryColor=Color.fromRGBO(210,200,151, 1);
                                      subtitle='Ropa y acsesorios';
                                      _controllerViewer.animateToPage(1, duration: Duration(seconds: 1),curve: Curves.ease);

                                    });
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(top: 30,bottom: 30,left: 5.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:<Widget>[
                                              Text("Ropa y accesorios",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                                            ]
                                        ),
                                        Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children:<Widget>[
                                              Text("Productos Misceláneos",style: TextStyle(color: Colors.white,fontSize: 12.0),),
                                            ]
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
            ListView(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                        Flexible(
                          child: ListTile(
                            title: Text('Comercios que venden '+subtitle,style: TextStyle(color: Colors.grey,fontSize: 18.0),),
                            leading:IconButton(
                              color: Colors.grey,
                              icon: Icon(Icons.arrow_back),
                              onPressed: ()async{
                                await _controllerViewer.animateToPage(0, duration: Duration(seconds: 1),curve: Curves.ease);
                                setState(() {
                                  subtitle='';
                                });
                              },
                            ),
                          ),
                        )
                    ],
                  ),
                ),
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Material(
                                child: Container(
                                  width: MediaQuery.of(context).size.width-10.0,
                                  decoration: BoxDecoration(
                                    //color: Color.fromRGBO(9,173,120, 1),
                                      color: auxiliaryColor,//gris
                                      //color: Color.fromRGBO(255,149,2,1),
                                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                                  ),
                                  child: FlatButton(
                                    onPressed: (){
                                      Navigator.pushNamed(context, '/products',arguments:'consummer');
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.all(30.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children:<Widget>[
                                                Text("Fruver la plaza",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  child: Placeholder(),
                                                )
                                              ]
                                          ),
                                        ],
                                      ),
                                    )
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                      //Verduras,lacteos,Harinas,Carnes
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Material(
                                child: Container(
                                  width: MediaQuery.of(context).size.width-10.0,
                                  decoration: BoxDecoration(
                                    //color: Color.fromRGBO(9,173,120, 1),
                                      color: auxiliaryColor,//gris
                                      //color: Color.fromRGBO(255,149,2,1),
                                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(30.0),
                                    child: FlatButton(
                                      onPressed: (){
                                      },
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children:<Widget>[
                                                Text("La Canasta",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  child: Placeholder(),
                                                )
                                              ]
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Material(
                                child: Container(
                                  width: MediaQuery.of(context).size.width-10.0,
                                  decoration: BoxDecoration(
                                    //color: Color.fromRGBO(9,173,120, 1),
                                      color: auxiliaryColor,//gris
                                      //color: Color.fromRGBO(255,149,2,1),
                                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(30.0),
                                    child: FlatButton(
                                      onPressed: (){
                                        Navigator.pushNamed(context, '/products',arguments:'consummer');
                                      },
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children:<Widget>[
                                                Text("Don Pepito",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  child: Placeholder(),
                                                )
                                              ]
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Material(
                                child: Container(
                                  width: MediaQuery.of(context).size.width-10.0,
                                  decoration: BoxDecoration(
                                    //color: Color.fromRGBO(9,173,120, 1),
                                      color: auxiliaryColor,//gris
                                      //color: Color.fromRGBO(255,149,2,1),
                                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(30.0),
                                    child: FlatButton(
                                      onPressed: (){
                                        Navigator.pushNamed(context, '/products',arguments:'consummer');
                                      },
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children:<Widget>[
                                                Text("Don Ramón",style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold),),
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  child: Placeholder(),
                                                )
                                              ]
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                          ),
                        ],
                      ),
                    ],
                  )
              ],
            ),
          ],
        )
      ),
    );
  }


}