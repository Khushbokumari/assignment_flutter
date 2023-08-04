import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyPhone extends StatefulWidget {
  static String verify="";
  const MyPhone({Key? key}) : super(key: key);

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController countryController = TextEditingController();
  var phone="";



  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+91";
    super.initState();
  }
  // Method to handle Google Sign-In
  Future<void> _handleGoogleSignIn() async {
    try {
      // Perform the Google Sign-In
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        // Google Sign-In succeeded, now we can use the GoogleSignInAccount to sign in with Firebase
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in to Firebase using the Google Auth Credential
        await _auth.signInWithCredential(credential);

        // At this point, the user is signed in with Firebase using Google Sign-In
        // You can navigate to the next screen or perform other actions as needed
        Navigator.pushNamed(context, 'home'); // Example navigation to home screen
      }
    } catch (e) {
      // Handle Google Sign-In errors
      print('Google Sign-In failed: $e');
      // Show an error message to the user or perform actions accordingly
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/illustration-2.png',
                ),
              ),
              // Image.asset(
              //   'assets/images/illustration-2.png',
              //   width: 150,
              //   height: 150,
              // ),
              SizedBox(
                height: 25,
              ),
              Text(
                "Welcome",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "We need to register your phone without getting started!",
                style: TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child:Expanded(

                    child: TextField(

                      onChanged: (value){
                        phone=value;
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Name",
                      ),
                    ))
              ),
              SizedBox(height: 20,),
              Container(
                height: 55,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: 40,
                      child: TextField(
                        controller: countryController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Text(
                      "|",
                      style: TextStyle(fontSize: 33, color: Colors.grey),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(

                        child: TextField(

                          onChanged: (value){
                            phone=value;
                          },
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone",
                          ),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.green.shade600,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      await FirebaseAuth.instance.verifyPhoneNumber(
                        phoneNumber: '${countryController.text+phone}',
                        verificationCompleted: (PhoneAuthCredential credential) {},
                        verificationFailed: (FirebaseAuthException e) {},
                        codeSent: (String verificationId, int? resendToken) {
                          MyPhone.verify=verificationId;
                          Navigator.pushNamed(context, 'verify');
                        },
                        codeAutoRetrievalTimeout: (String verificationId) {},

                      );

                      // Navigator.pushNamed(context, 'verify');
                    },
                    child: Text("Send the code")),
              ),
              SizedBox(height: 20,),
              SizedBox(
                width: double.infinity,
                height: 45,
                child:  MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 50,
                  onPressed: _handleGoogleSignIn

                    //Here goes the logic for Google SignIn discussed in the next section
                  ,
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.g_mobiledata),
                      SizedBox(width: 10),
                      Text('Sign-in using Google',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                  textColor: Colors.white,
                ),
                // ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //         primary: Colors.green.shade600,
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(10))),
                //     onPressed: _handleGoogleSignIn,
                //     child: OutlinedButton.icon(onPressed:  _handleGoogleSignIn, icon: Icon(Icons.g_mobiledata,size: 35,color: Colors.white,),
                //         label: Text('Login with Google',
                //           style: TextStyle(fontSize: 18,color: Colors.white),))
                // ),
              ),


            ]
        ),
      ),)
    );
  }

}
