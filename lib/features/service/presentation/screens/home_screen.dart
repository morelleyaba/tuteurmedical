import 'package:flutter/material.dart';
import 'package:tuteur_medical/core/constants/app_colors.dart';
import 'package:tuteur_medical/core/constants/app_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _seachController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [AppColors.primayColor, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
          ),
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                title: Text(
                  "e-Service",
                  style: TextTheme.of(context).titleLarge,
                ),
                automaticallyImplyLeading: false,
                actions: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Icon(Icons.notifications_active_outlined),
                  )
                ],
              ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal:10.0),
                   child: SearchBar(
                        padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical : 0,horizontal: 10)),
                        controller: _seachController,
                        leading: Icon(Icons.search),
                        hintText: "Quel service recherchez vous ??",
                        hintStyle: WidgetStatePropertyAll(TextStyle(color: Colors.grey)),
                      ),
                 ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.defaultvalue * .5),
                  child: Column(
                    children: [
                   
                      // GestureDetector(
                      //   onTap: () {
                      //     HiveUtils.logOut();
                      //   },
                      //   child: Text("Deconnection"),)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

