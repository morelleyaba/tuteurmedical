import 'package:flutter/material.dart';
import 'package:tuteur_medical/core/constants/app_colors.dart';
import 'package:tuteur_medical/core/constants/app_constants.dart';

import '../../../../core/utils/hive/hive_utils.dart';
import '../../../../shared/components/app_bar_widget.dart';
import '../../data/datasources/service_local_datasource.dart';
import '../components/search_bar_widget.dart';
import '../components/service_list_item.dart';

// GestureDetector(
//   onTap: () {
//     HiveUtils.logOut();
//   },
//   child: Text("Deconnection"),)
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _seachController = TextEditingController();

  final services = ServiceLocalDatasource().servicesList();

  int index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height * .3,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [AppColors.primayColor.shade600, Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
            ),
          ),
          Column(
            children: [
              const AppBarWidget(),
              // searchbar
              SearchBarWidget(seachController: _seachController),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppConstants.defaultvalue * .5),
                  child: Column(
                    children: [
                      _buildListItem(),
                      Container(
                        padding: EdgeInsets.all(8),
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: size.width,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: AppColors.primayColor.shade700),
                        height: size.height * .25,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                               Text(
                                      "Trouver un professionnel de santé",
                                      style: TextTheme.of(context).titleLarge?.copyWith(color: Colors.white),
                                    ),
                                  Text("", style: TextTheme.of(context).bodyLarge?.copyWith(color: Colors.white),),
                                   Container(
                                    margin: const EdgeInsets.symmetric(vertical: 10),
                                    padding: const EdgeInsets.all(8),
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        color: Colors.white70),
                                    child: const Text(
                                      "Plus de details",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                
                                ],
                              ),
                            ),
                          
                          Expanded(child: Image.asset("name"))
                          ],
                        ),
                      )
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

  Widget _buildListItem() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...services.map((e) {
            return GestureDetector(
                onTap: () {
                  setState(() {
                    index = e.id;
                    print("affiche ${index}");
                  });
                },
                child: ServiceListItem(
                  index: index,
                  service: e,
                ));
          }),
        ],
      ),
    );
  }
}
