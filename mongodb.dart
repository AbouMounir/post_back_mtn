import 'dart:developer';

import 'package:flutter_pratique/dbhelper/constant.dart';
import 'package:flutter_pratique/dbhelper/users_model.dart';
import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  static var db, userCollection;
  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);
  }

  static Future<String> insert(UserModel data) async {
    try {
      var result = await userCollection.insertOne(data.toJson());
      if (result.isSuccess) {
        return "Data inserted";
      } else {
        return "Something Wrong";
      }
    } catch (e) {
      print(e.toString());
      return e.toString();
    }
  }
}
