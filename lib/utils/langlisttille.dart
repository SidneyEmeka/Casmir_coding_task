import 'package:casmir/state/casmirx.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Langlisttille extends StatelessWidget {
  final String selected;
  const Langlisttille({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(selected,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.tertiary),),
          Get.find<Casmirx>().selectedLang.value == selected?Icon(Icons.radio_button_checked,color: Theme.of(context).colorScheme.tertiary,size: 20,)
              : Icon(Icons.circle_outlined,color: Theme.of(context).colorScheme.tertiary,size: 20,),
        ],
      ),
    );
  }
}
