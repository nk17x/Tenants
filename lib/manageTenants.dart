import 'package:flutter/material.dart';
import 'package:tenants_app/tenantsList.dart';

class manageTenants extends StatefulWidget {
  const manageTenants({super.key});

  @override
  State<manageTenants> createState() => _manageTenantsState();
}

class _manageTenantsState extends State<manageTenants> {
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
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        ),
        body: SafeArea(
            child: Container(
                color: Colors.white,
                height: height,
                width: width,
                child: Column(
                  children: [
                    DropdownButtonFormField(
                      items: [DropdownMenuItem(child: Text(""))],
                      onChanged: (value) => {},
                    )
                  ],
                ))));
  }
}
