import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
// import 'package:tenants_app/tenantsList.dart';
import 'constants.dart';

TextEditingController wingNameCtrl = TextEditingController();
TextEditingController tenantNameCtrl = TextEditingController();
TextEditingController tenantRoomNoCtrl = TextEditingController();
TextEditingController tenantRentAmountCtrl = TextEditingController();

List<String> houseList = <String>[];
String selectedWing = "";

class manageTenants extends StatefulWidget {
  const manageTenants({super.key});

  @override
  State<manageTenants> createState() => _manageTenantsState();
}

class _manageTenantsState extends State<manageTenants> {
  final GlobalKey<FormFieldState> _key = GlobalKey<FormFieldState>();

  @override
  void initState() {
    // createHouseList();

    getWingData();
    super.initState();
  }

  @override
  void dispose() {
    clearData();
    super.dispose();
  }

  void getWingData() async {
    constants.wingRef.onValue.listen((DatabaseEvent event) async {
      if (!event.snapshot.exists) return;
      final wingDataRef = event.snapshot.value as List;
      if (mounted) {
        setState(() {
          wingDataRef.forEach((element) {
            houseList.add(element.toString());
          });
          houseList = houseList.toSet().toList();
        });
      }
    });
  }

  void addWingData({required String wingName}) async {
    final temp = await constants.wingRef.get();
    if (!temp.exists) {
      await constants.wingRef.set({"0": "$wingName"});
      wingNameCtrl.text = "";
      Navigator.pop(context);
      return;
    }
    final wingDataRef = temp.value as List;
    print(wingDataRef);

    await constants.wingRef.update({"${wingDataRef.length}": "$wingName"});
    wingNameCtrl.text = "";
    clearData();
    Navigator.pop(context);
  }

  void addTenantData(
      {required String wingName,
      required String roomNo,
      required String tenantName,
      required String rentAmount}) async {
    if (selectedWing == "") {
      snackbar("Please select a Wing!");
      return;
    } else if (tenantNameCtrl.value.text == "") {
      snackbar("Please enter valid Tenant Name!");
      return;
    } else if (tenantRoomNoCtrl.value.text == "") {
      snackbar("Please enter valid Room No!");
      return;
    } else if (tenantRentAmountCtrl.value.text == "") {
      snackbar("Please enter valid Rent Amount!");
      return;
    }
    final temp = await constants.tenantsDataRef.child("$wingName/").get();
    if (!temp.exists) {
      await constants.tenantsDataRef.child("$wingName/").set({
        "0": {
          "name": tenantName,
          "room no": roomNo,
          "rentAmount": rentAmount,
          "rentMonth": "JUNE",
          "rentYear": "2023",
          "paymentStatus": "pending"
        }
      }).whenComplete(
          () => {snackbar("Tenant has been added successfully!"), clearData()});

      return;
    }
    final wingDataRef = temp.value as List;
    print(wingDataRef);

    await constants.tenantsDataRef.child("$wingName/").update({
      "${wingDataRef.length}": {
        "name": tenantName,
        "room no": roomNo,
        "rentAmount": rentAmount,
        "rentMonth": "JUNE",
        "rentYear": "2023",
        "paymentStatus": "pending"
      }
    }).whenComplete(
        () => {snackbar("Tenant has been added successfully!"), clearData()});
  }

  snackbar(String text) {
    return {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          content: Text(
            text,
            style: TextStyle(color: Colors.white),
          )))
    };
  }

  // areAllInputsFilled() {
  //   if (selectedWing == "") {
  //     snackbar("Please select a Wing!");
  //     return;
  //   } else if (tenantNameCtrl.value.text == "") {
  //     snackbar("Please enter valid Tenant Name!$selectedWing");
  //     return;
  //   } else if (tenantRoomNoCtrl.value.text == "") {
  //     snackbar("Please enter valid Room No!");
  //     return;
  //   } else if (tenantRentAmountCtrl.value.text == "") {
  //     snackbar("Please enter valid Rent Amount!");
  //     return;
  //   }
  //   return;
  // }

  void clearData() {
    selectedWing = "";
    wingNameCtrl.text = "";
    tenantNameCtrl.text = "";
    tenantRentAmountCtrl.text = "";
    tenantRoomNoCtrl.text = "";
    _key.currentState?.reset();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Tenants App",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          color: Colors.white,
          height: height,
          width: width,
          child: Column(
            children: [
              Container(
                height: height * 0.085,
                width: width * 0.9,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(20),
                    border:
                        Border.all(color: Color.fromARGB(51, 158, 158, 158))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: width * 0.63,
                      child: DropdownButtonFormField(
                        key: _key,
                        alignment: AlignmentDirectional.centerEnd,
                        borderRadius: BorderRadius.circular(20),
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                            prefixIcon: Icon(Icons.house_sharp),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        hint: Text("Select Wing"),
                        items: houseList
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            // alignment: AlignmentDirectional.center,
                            value: value,
                            child: Column(
                              children: [Text(value.toUpperCase().padLeft(15))],
                            ),
                          );
                        }).toList(),
                        onChanged: (value) => {selectedWing = value.toString()},
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          showDialog<String>(
                            barrierDismissible: false,
                            useSafeArea: true,
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('        Tenants App'),
                              content: TextFormField(
                                controller: wingNameCtrl,
                                decoration: InputDecoration(
                                  hintText: "Enter Wing Name",
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20, 10, 10, 10),
                                  prefixIcon: Icon(Icons.house_sharp),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              actions: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'Cancel'),
                                      child: const Text('Cancel'),
                                    ),
                                    TextButton(
                                      onPressed: () => {
                                        addWingData(
                                            wingName: wingNameCtrl.value.text)
                                      },
                                      child: const Text('Save'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                        child: Text("Add Wing")),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 400,
                width: width * 0.9,
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(20),
                    border:
                        Border.all(color: Color.fromARGB(51, 158, 158, 158))),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Create new Tenant",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 22, top: 10),
                                child: Text("Name")),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            controller: tenantNameCtrl,
                            decoration: InputDecoration(
                              hintText: "Enter Tenant Name",
                              contentPadding:
                                  EdgeInsets.fromLTRB(14, 10, 10, 10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 22, top: 10),
                                child: Text("Room No")),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            maxLength: 3,
                            controller: tenantRoomNoCtrl,
                            decoration: InputDecoration(
                              hintText: "Enter Room No",
                              contentPadding:
                                  EdgeInsets.fromLTRB(14, 10, 10, 10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: 22, top: 0),
                                child: Text("Rent Amount")),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            maxLength: 5,
                            controller: tenantRentAmountCtrl,
                            decoration: InputDecoration(
                              hintText: "Enter Rent Amount",
                              contentPadding:
                                  EdgeInsets.fromLTRB(14, 10, 10, 10),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          addTenantData(
                              wingName: selectedWing,
                              roomNo: tenantRoomNoCtrl.value.text,
                              rentAmount: tenantRentAmountCtrl.value.text,
                              tenantName: tenantNameCtrl.value.text);
                        },
                        child: Text("Proceed"))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
