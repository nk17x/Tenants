import 'package:firebase_database/firebase_database.dart';
import 'package:tenants_app/tenantsList.dart';

class constants {
  static Map tenantslistConst = {};
  static DatabaseReference ref = FirebaseDatabase.instance.ref("tenantsList/");
  static DatabaseReference tenantsDataRef =
      FirebaseDatabase.instance.ref("tenantsList2/");
  static DatabaseReference wingRef = FirebaseDatabase.instance.ref("wingList/");
}
