import 'package:animation_list/animation_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:school_management/Repository.dart';
import 'package:school_management/globals.dart';

class Classes extends StatefulWidget {
  @override
  State<Classes> createState() => _ClassesState();
}

class _ClassesState extends State<Classes> {
  List classData = [];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

// final ref = FirebaseDatabase.instance.ref();
//  var snapshot=null;
  Future getData() async {
    // snapshot = await ref.child('classes_data').get();
    //
    //  if (snapshot.exists) {
    //    classData=snapshot.value.toString();
    //    print("Data is"+snapshot.value.toString());
    //    print("Data is"+classData);
    //  } else {
    //    print('No data available.');
    //  }

    Repository repo = Repository();
    classData = await repo.getClassesData();
    setState(() {
      classData = classData;
    });
  }

  Widget _buildListView() {
    return Container(
        height: MediaQuery.of(context).size.height / 1.3,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: classData != null ? classData.length : 0,
          itemBuilder: (BuildContext context, int index) {
            String ClassesName = "";
            String Fee = "";
            String DefaultTeacher = "Ali";
            // String PurposeTypeLabel = "";

            if (classData[index]["label"] != null) {
              ClassesName = classData[index]["label"];
            }

            if (classData[index]["fee"] != null) {
              Fee = classData[index]["fee"].toString();
            }
            // if (classData[index]["teacher"] != null) {
            //   DefaultTeacher = classData[index]["teacher"].toString();
            // }

            String ListText =
                "Class Teacher: $DefaultTeacher \nClasses: $ClassesName \nFee: $Fee";

            // if (filter == null || filter == "") {
            return Card(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                    child: ListTile(
                      onTap: () async {
                        // List selectedRequests = new List();
                        // selectedRequests.add(classData[index]);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (context) =>
                        //           ContingencyAssetApprovalDetail(
                        //               selectedRequests: selectedRequests)),
                        // );
                      },
                      // trailing: Text(
                      //   PurposeTypeLabel,
                      //   style: TextStyle(color: Color(0xFF004b93)),
                      // ),
                      title: Text(Fee + " - " + ClassesName,
                          // allRequests[index]["UnitID"] +
                          //     " - " +
                          //     allRequests[index]["UnitLabel"],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Text(ListText, style: const TextStyle(fontSize: 15)),
                        ],
                      ),
                    )));
            // }
            // else {
            //   if (allRequests[index]['UnitLabel']
            //       .toLowerCase()
            //       .contains(filter.toLowerCase()) ||
            //       allRequests[index]['UnitID']
            //           .toLowerCase()
            //           .contains(filter.toLowerCase())) {
            //     return Card(
            //         child: Container(
            //             width: MediaQuery.of(context).size.width,
            //             padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            //             child: ListTile(
            //               onTap: () async {
            //                 List selectedRequests = new List();
            //                 selectedRequests.add(allRequests[index]);
            //                 Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                       builder: (context) =>
            //                           ContingencyAssetApprovalDetail(
            //                               selectedRequests: selectedRequests)),
            //                 );
            //               },
            //               trailing: Text(
            //                 PurposeTypeLabel,
            //                 style: TextStyle(color: Color(0xFF004b93)),
            //               ),
            //               title: Text(
            //                   allRequests[index]["UnitID"] +
            //                       " - " +
            //                       allRequests[index]["UnitLabel"],
            //                   style: new TextStyle(
            //                       fontSize: 18, fontWeight: FontWeight.bold)),
            //               subtitle: Column(
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 mainAxisSize: MainAxisSize.max,
            //                 children: <Widget>[
            //                   Text(ListText, style: new TextStyle(fontSize: 15)),
            //                 ],
            //               ),
            //             )));
            //   } else {
            //     return Container();
            //   }
            // }
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Classes"),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_sharp),
          ),
        ),
        //TODO: The issue is that the list does not update after navigation.
        body: SingleChildScrollView(
            child: Column(children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => ClassInfo()));
            },
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(30),
                  color: Theme.of(context).primaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.add),
                      Container(
                        height: 5,
                      ),
                      Text(
                        "Add New Classes",
                        style: TextStyle(
                            color: Theme.of(context).bottomAppBarColor,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          AnimationList(
            duration: 2000,
            reBounceDepth: 70,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [_buildListView()],
          ),
        ])));
  }
}

class ClassInfo extends StatefulWidget {
  @override
  State<ClassInfo> createState() => _ClassInfoState();
}

class _ClassInfoState extends State<ClassInfo> {
  // DatabaseReference ref = FirebaseDatabase.instance.ref("classes_data");

  // FirebaseDatabase database = FirebaseDatabase.instance;
  // FirebaseApp DB = Firebase.app('class');

  // FirebaseDatabase DB = FirebaseDatabase.instanceFor(app: );

  TextEditingController ClassName = TextEditingController();
  TextEditingController Fee = TextEditingController();
  Repository repo = Repository();

  @override
  void dispose() {
    super.dispose();
    ClassName.dispose();
    Fee.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Class Info"),
        leading: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: kPrimaryColor,
            elevation: 0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_sharp),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Name Of Class',
              ),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              controller: ClassName,
              // onChanged: (value) {
              //   ClassName.text = value;
              // },
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Monthly Fee',
              ),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              controller: Fee,
              // onChanged: (value) {
              //   Fee.text = value;
              // },
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).bottomAppBarColor,
                minimumSize: const Size(100, 40),
              ),
              onPressed: () async {
                // await ref.child(ClassName.text).set({
                //      "Fee": Fee.text,
                //     });
                repo.insertClasses(ClassName.text, int.parse(Fee.text)).onError(
                    (error, stackTrace) =>
                        print("Failed to enter the classses"));
                ClassName.clear();
                Fee.clear();
              },
              child: const Text("Submit"),
            ),
          ],
        ),
      ),
    );
  }
}

// StreamBuilder<QuerySnapshot>(
// stream: _message
//     .collection("Chat_Data")
// .orderBy('createdAt', descending: false)
// .snapshots(),
// builder: (context, snapshot) {
// List<MessageBubble> messageBubbles = [];
// if (snapshot.hasData) {
// final message =
// (snapshot.data as QuerySnapshot).docs.reversed;
// for (var chatData in message) {
// final messageText = chatData['message'];
// final messageSender = chatData['sender'];
// //checking isMe that its logged in this device or not.
// final messageBubble = MessageBubble(
// sender: messageSender,
// message: messageText,
// isMe: loggedInUser == messageSender,
// );
// const TextStyle(color: Colors.green);
// messageBubbles.add(messageBubble);
// }
// }
// return Expanded(
// child: Padding(
// padding: const EdgeInsets.all(8.0),
// //displaying message as listview.
// child: ListView(
// reverse: true,
// children: messageBubbles,
// ),
// ),
// );
// },
// ),
