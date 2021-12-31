import 'package:application_enviproduct_v01/src/widgets/velocimetro_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class VelocimetroPage extends StatelessWidget {
  const VelocimetroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 180.h,
            flexibleSpace: FlexibleSpaceBar(
              background:Image.asset("assets/images/carretera.jpg",fit: BoxFit.cover ),
              
              ),
          ),
          const SliverFillRemaining(child: VelocimetroWidget())
        ],
      ),
    ));
  }
}
