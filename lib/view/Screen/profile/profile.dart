import 'package:dslsale/data/controller/auth_controller.dart';
import 'package:dslsale/util/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _userName = "";
  String _roleName = "";
  String _departName = "";

  Future _loadprofile() async {
    SharedPreferences prefers = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefers.getString('full_name') ?? null.toString();
    _departName = prefers.getString('depart_name') ?? null.toString();
    _roleName = prefers.getString('role_name') ?? null.toString();
    });
  }

  @override
  void initState() {
    _loadprofile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //================= header ===============
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        title: const Text(
          "ໂປຣໄຟລ໌",
          style: textTitle,
        ),
      ),

      //================ content body ====================
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                        height: 80,

                        //============== card ====================
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Name",
                                      style: textSimplegrey,
                                    ),
                                    Text(
                                      _userName,
                                      style: textTitleGrey,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 80,

                        //============== card ==================
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "ພະແນກ  ",
                                      style: textSimplegrey,
                                    ),
                                    Text(
                                      _departName,
                                      style: textTitleGrey,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                        height: 80,

                        //============== card ==================

                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "ສິດ  ",
                                      style: textSimplegrey,
                                    ),
                                    Text(
                                      _roleName,
                                      style: textTitleGrey,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Consumer<AuthController>(builder: (context, value, _) {
                return InkWell(
                  onTap: () {
                    value.clearprefers();
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.8,
                    height: 50,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: const Center(
                        child: Text(
                      "ອອກຈາກລະບົບ",
                      style: textTitlewhite,
                    )),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
