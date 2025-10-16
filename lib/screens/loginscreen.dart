import 'package:flutter/material.dart';

import 'package:grocery_app/screens/mainscreen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  bool _obscurePassword = true;
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Container(
          width: size.width,
        height: size.height,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [SizedBox(
            height: 200,
            child: Image.asset('assets/images/splashimage.jpeg'),
          ),
          SizedBox(height: 30),
         TextField(
                    
                    decoration: InputDecoration(
                      hintText: 'Username',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      filled: true,
                      fillColor: Colors.grey[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.green, width: 2),
                      ),
                   
                    ),
                  ),
            SizedBox(height: 30),       
          TextField(
                    // controller: _emailController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey[400]),
                      suffixIcon: IconButton(icon: Icon(_obscurePassword?Icons.visibility_off_outlined:Icons.visibility_outlined),
                      onPressed: () {
                        setState(() {
                         _obscurePassword = ! _obscurePassword; 
                        });
                      },),
                      filled: true,
                      fillColor: Colors.grey[50],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.green, width: 2),
                      ),
                
                    ),
                  ),
                  SizedBox(height: 10), 
         Align(
          alignment: AlignmentGeometry.centerRight,
          child: TextButton(child: Text('Forgot password',style: TextStyle(color: Colors.grey)) ,onPressed: (){})),
         SizedBox(
           width: double.infinity,
           child: ElevatedButton(
             onPressed: () {
               Navigator.push(
                 context,
                 MaterialPageRoute(builder: (context) => Loginscreen()),
               );
             },
             style: ElevatedButton.styleFrom(
               backgroundColor: Colors.green,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(12),
               )
             ),
             child: TextButton(child: Text('Sign In',style: TextStyle(color: Colors.white),),
             
             onPressed: (){
              Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainScreen()),
                        );
             }),
           ),
         ),
         SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(onPressed: (){}, label: Text('Continue with google',style: TextStyle(color: Colors.black)),style: OutlinedButton.styleFrom(backgroundColor: Colors.grey[50],shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),),
                      
                    icon: Image.asset(
                      'assets/images/googleimage.png',
                      height: 24,
                      width: 24,)
                    ),
                  )
          ],
        ),
      ),
    );
  }
}