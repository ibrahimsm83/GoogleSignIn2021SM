import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

//Future<String> signInWithGoogle() async {}
//void signOutGoogle() async{}

Future<String> signInWithGoogle() async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
  await googleSignInAccount.authentication;

  //final AuthCredential credential = GoogleAuthProvider.getCredential(
  final AuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

 // final AuthResult authResult = await _auth.signInWithCredential(credential);
  final UserCredential authResult=await _auth.signInWithCredential(credential);
  //final FirebaseUser user = authResult.user;
  final User user =authResult.user;
if(user != null)
  {
    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);
    final User currentUser =_auth.currentUser;
    assert(user.uid==currentUser.uid);
    print('SignInWithGoogle Succeeded: $user');
    return '$user';
  }
return null;
 //assert(!user.isAnonymous);

 // assert(await user.getIdToken() != null);

  //final FirebaseUser currentUser = await _auth.currentUser();
  // final User useri =_auth.currentUser;
  // assert(user.uid == useri.uid);
  //
  // return 'signInWithGoogle succeeded: $user';
}

Future<void> signOutGoogle() async{
  await googleSignIn.signOut();
  print("User Sign Out");
}