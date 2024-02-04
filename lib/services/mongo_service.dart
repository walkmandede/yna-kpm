// import 'package:mongo_dart/mongo_dart.dart';
// import 'package:get/get.dart';
// import 'package:wedding_app/constants/app_functions.dart';
//
// class MongoDatabaseService{
//
//
//    Db _db = Db('');
//
//   String idParser(Map data){
//     ObjectId objectId = data['_id'];
//     return objectId.oid;
//   }
//
//   Future<bool> connect() async{
//     try{
//       _db = await Db.create('mongodb+srv://walkmandede:sio64ati7o@cluster0.qag8tm8.mongodb.net/ynakpm?retryWrites=true&w=majority');
//       await _db.open();
//       return true;
//     }
//     catch(e){
//       superPrint("ERROR : ${e.toString()}",title: "Error Connection Database");
//       // Get.offAll(()=> UnableToConnectDatabaseWidget(errorMessage: e.toString()));
//       return false;
//     }
//   }
//
//   Future<void> disconnect() async{
//     try{
//       await _db.close();
//     }
//     catch(e){
//       superPrint("ERROR : ${e.toString()}",title: "Error Connection Database");
//       // Get.offAll(()=> UnableToConnectDatabaseWidget(errorMessage: e.toString()));
//     }
//   }
//
//   DbCollection getCollection({required String colName}){
//     return _db.collection(colName);
//   }
//
//   Future<List<Map>> getCollectionAllData({required String colName}) async{
//     return await _db.collection(colName).find().toList();
//   }
//
//   // Future<Map> findByObjectId({required String objectId}) async{
//   //   DbCollection roomCollection = MongoDatabase().getCollection(colName: MongoDatabase.colRooms);
//   //   List res = await roomCollection.find({"_id" : ObjectId.parse(objectId)}).toList();
//   //   return res.first;
//   // }
//
//   Future<Map> deleteDocument({required String colName,required String objectId}) async{
//     return await _db.collection(colName).remove({"_id" : ObjectId.parse(objectId)});
//   }
//
//   Future<void> updateDocument({required String colName,required String objectId,required Map<String,dynamic> json}) async{
//     await _db.collection(colName).replaceOne({"_id" : ObjectId.parse(objectId)},json);
//   }
//
//   Future<WriteResult?> insertDataIntoCollection({required String colName,required Map<String,dynamic> data}) async{
//     WriteResult? writeResult;
//     try{
//       await connect();
//       DbCollection collection = getCollection(colName: colName);
//       writeResult = await collection.insertOne(data);
//       await disconnect();
//     }
//     catch(e){
//       superPrint(e);
//     }
//     return writeResult;
//   }
//
// }
//
// class MongoCollections{
//   static String views = 'views';
//   static String wishes = 'wishes';
//   static String rsvp = 'rsvp';
// }