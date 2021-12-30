import 'package:firebase_auth/firebase_auth.dart';
import 'package:garnbarn_mobile/services/garnbarn_apis/apis/v1/errors/user_not_signed_in.dart';

class GarnBarnApi {
  late User _firebaseUser;

  GarnBarnApi() {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser == null) {
      throw UserNotSignedIn();
    }
    _firebaseUser = auth.currentUser!;
  }
}
