// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:profilui/profiles/profile1/provider.dart';
import 'package:profilui/profiles/profile1/user.dart';
import 'package:profilui/sheard/style/icon_broken.dart';

class Profile1 extends StatefulWidget {
  const Profile1({Key? key}) : super(key: key);

  @override
  State<Profile1> createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {
  Color _textColor=Color(0XFF4e4e4e);
  Profile profile=ProfileProvider.getProfile();
TextStyle _chiffrestyl=TextStyle( 
                          fontSize: 22,
                        color: Color(0XFF4e4e4e),
                            fontWeight: FontWeight.w600,);
  TextStyle _titlechiffre=TextStyle(
    
                          color: Colors.grey[350]);
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        fontFamily: 'SFUI'
      ), 
      child:  Stack(
      children: [
        Image.asset('assets/profiles/bgprofile.jpg',
        fit: BoxFit.cover,
        height: MediaQuery.of(context).size.height*0.45,//musure avec photoshop
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              // ignore: prefer_const_constructors
              icon:Icon(   
              Icons.menu_rounded),
              onPressed: (){},
          ),
          centerTitle: true,
            // ignore: prefer_const_constructors
            title: Text("Profile",
            // ignore: prefer_const_constructors
            style: TextStyle(
              letterSpacing: 1.1,
              fontWeight: FontWeight.bold),),
            actions: [
              IconButton(onPressed: (){},
               icon: Icon(Icons.settings))
            ],
          ),
          body:Stack(
            children: [
          CustomPaint(
          painter: ProfilePainter(),
          child: Container(
         ),
        ),
        Positioned(
          left:MediaQuery.of(context).size.height*0.03 ,
          top: MediaQuery.of(context).size.height*0.23 ,
          child: CircleAvatar(
            minRadius:40,
            backgroundImage:ExactAssetImage("assets/sheard/profilewomen.jpg"),
          
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.height*0.03,
          bottom: 0,
          right: 0,
          top: MediaQuery.of(context).size.height*0.35,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(profile.user!.name??'',
                 textScaleFactor: 1.2,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 32,
                  color: _textColor
                ),),
                SizedBox(height: 5,),
                    Row(
              children: [
                Icon(IconBroken.Location ,
                size: 15,
                color: Colors.grey.shade400,),
                Text(profile.user!.address??'',
               
                textScaleFactor: 1,
                style: TextStyle(
                  color: _textColor
                  
                ),)
              ],
            ),
               ],
            ),
        
            Text("ABOUT ME",style: TextStyle(
              color: Colors.grey[400]
            ),),
            Padding(
              padding: const EdgeInsets.only(right:20.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(profile.user!.about??'',
                softWrap: true,
                  style: TextStyle(
                    color: _textColor,

                  ),
                )),
            ),
         
            Padding(
              padding: const EdgeInsets.only(right:20.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      Column(
                        children: [
                          Text('FLLOWERS'.toUpperCase(),
                          style: _titlechiffre,),
                           SizedBox(height: 8,),
                          Text(profile.followers.toString(),
                          style:_chiffrestyl)
                        ],
                      ),
                      
                      Column(
                        
                        children: [
                          Text('Following'.toUpperCase(), 
                          style:  _titlechiffre),
                        SizedBox(height: 8,),

                          Text(profile.following.toString(),   
                          style:_chiffrestyl)
                          
                        ],
                      ),
                         Column(
                        children: [
                          Text('friends'.toUpperCase(),
                            
                            style:  _titlechiffre
                          
                          ),
                       SizedBox(height: 8,),

                          Text(profile.friends.toString(),
                          style: _chiffrestyl)
                        ],
                      ),
                  ],
                ),
            ),
           
          
          ],) ),
     
        
           
            ],)
        ),
  
      
     
      ],
      
    ),
  );


 
  
  }
}

class ProfilePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) 
  {
   Paint paint=Paint();
   Path path=Path();
   paint.color=Colors.white;

  
    path.lineTo(0,size.height*0.32);
     path.lineTo(size.width,size.height*0.39);
      path.lineTo(size.width,size.height);
      path.lineTo(0,size.height);
       path.lineTo(0,size.height*0.25);
        path.close();
        canvas.drawPath(path, paint);     
 

  }
  bool shouldRepaint(CustomPainter oldDelegate)=>false;
  
}