import 'package:firebase_auth/firebase_auth.dart';
import 'package:garnbarn_mobile/services/garnbarn_apis/apis/v1/assignment_apis_v1.dart';

class V1 {
  final User _firebaseUser;
  const V1(this._firebaseUser);

  AssignmentApisV1 get assignment {
    return AssignmentApisV1(_firebaseUser);
  }
}
