//
// import 'package:flutter/material.dart';
// import 'package:wedding_app/constants/app_functions.dart';
// import 'package:wedding_app/services/mongo_service.dart';
//
// class MongoTestPage extends StatefulWidget {
//   const MongoTestPage({super.key});
//
//   @override
//   State<MongoTestPage> createState() => _MongoTestPageState();
// }
//
// class _MongoTestPageState extends State<MongoTestPage> {
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }
//
//   Future<void> initLoad() async{
//
//   }
//
//   Future<void> test() async{
//     MongoDatabaseService mongoDatabaseService = MongoDatabaseService();
//     final connectResult = await mongoDatabaseService.connect();
//     if(connectResult){
//       final result = await mongoDatabaseService.insertDataIntoCollection(
//           colName: MongoCollections.wishes,
//           data: {
//             "fieldA" : "value1",
//             "fieldB" : "value2"
//           }
//       );
//       if(result!=null){
//         superPrint(result!.success);
//       }
//       else{
//         superPrint("Result is null");
//       }
//     }
//     else{
//       //connectFail
//       superPrint("fail to connect");
//     }
//     await mongoDatabaseService.disconnect();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: SizedBox.expand(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 test();
//               },
//               child: const Text("Test"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
