import 'package:flutter/material.dart';
import 'package:hirrent/ewidget/button.dart';
import 'package:hirrent/home/widget/banner.dart';


class ModalBottomSheetDemo extends StatelessWidget {
  const ModalBottomSheetDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Center(
      child: ElevatedButton(
        child: const Text('showModalBottomSheet'),
        onPressed: () {
          // when raised button is pressed
          // we display showModalBottomSheet
          showModalBottomSheet<void>(
            // context and builder are
            // required properties in this widget
            context: context,
            builder: (BuildContext context) {
              // we set up a container inside which
              // we create center column and display text

              // Returning SizedBox instead of a Container
              return SizedBox(
                height: 400,
                child: Center(
                  child: Column(
                    children:[
                      BannerCard(imageUrl: '', heigh: 100,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Image.asset("assets/logo.png", height: 80,width: 80,),),
                      ),
                      submit(label: "Login",width: size.width/15, onCountSelected: () {  },),
                      Padding(
                        padding: EdgeInsets.only(top: size.height / 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.deepPurpleAccent,
                                      Colors.deepPurple,
                                    ],
                                    begin:
                                    const FractionalOffset(0.0, 0.0),
                                    end: const FractionalOffset(1.0, 1.0),
                                    stops: [0.0, 1.0],
                                    tileMode: TileMode.clamp),
                              ),
                              width: size.width / 4,
                              height: 1.0,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 15.0, right: 15.0),
                              child: Text(
                                "Or",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple,
                                    decoration: TextDecoration.none,
                                    fontSize: 15.0),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.deepPurple,
                                      Colors.deepPurpleAccent,
                                    ],
                                    begin:
                                    const FractionalOffset(0.0, 0.0),
                                    end: const FractionalOffset(1.0, 1.0),
                                    stops: [0.0, 1.0],
                                    tileMode: TileMode.clamp),
                              ),
                              width: size.width / 4,
                              height: 1.0,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: (){},
                        child: Center(
                          child: Image.asset("assets/whatsapp.png", height: size.height/10,),
                        ),
                      ),
                    ]
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}