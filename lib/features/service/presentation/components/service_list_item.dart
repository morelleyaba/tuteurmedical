
import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../data/models/service_model.dart';

class ServiceListItem extends StatelessWidget {
  const ServiceListItem({
    super.key,
    required this.index,
    required this.service,
  });

  final int index;
  final ServiceModel service;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin:
          EdgeInsets.symmetric(vertical: 16).copyWith(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color:
            (index == service.id) ? AppColors.primayColor : Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            service.icon,
            color: (index == service.id) ? Colors.white : Colors.black87,
          ),
          SizedBox(
            width: 4,
          ),
          Text(
            "${service.name}",
            style: TextStyle(
              color:
                  (index == service.id) ? Colors.white : Colors.black87,
            ),
          )
        ],
      ),
    );
  }
}
