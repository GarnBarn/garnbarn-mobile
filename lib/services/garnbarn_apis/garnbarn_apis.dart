import 'package:firebase_auth/firebase_auth.dart';
import 'package:garnbarn_mobile/services/garnbarn_apis/apis/v1/errors/user_not_signed_in.dart';
import 'package:garnbarn_mobile/services/garnbarn_apis/apis/v1/v1.dart';

class GarnBarnApi {
  late User _firebaseUser;

  GarnBarnApi() {
    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser == null) {
      throw UserNotSignedIn();
    }
    _firebaseUser = auth.currentUser!;
  }

  V1 get v1 {
    return V1(_firebaseUser);
  }
}
