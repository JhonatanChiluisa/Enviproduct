import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
class VelocimetroWidget extends StatelessWidget {
  const VelocimetroWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Colors.black12, Colors.grey])
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: SfRadialGauge(
              title: const GaugeTitle(
                text: 'Velocímetro',
                textStyle: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)
                ),
              enableLoadingAnimation: true,
              animationDuration: 4000,
              axes: <RadialAxis>[RadialAxis(
                minimum: 0,
                maximum: 150,
                pointers: const <GaugePointer>[NeedlePointer(
                  value: 90,
                  enableAnimation: true,
                  )], ranges:<GaugeRange>[
                    GaugeRange(startValue: 0, endValue: 50, color: Colors.green,),
                    GaugeRange(startValue: 50, endValue: 100, color: Colors.orange,),
                    GaugeRange(startValue: 100, endValue: 150, color: Colors.red,)
                  ], annotations: const <GaugeAnnotation>[
                    GaugeAnnotation(
                      widget: Text(
                        '90.0 MPH',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      positionFactor: 0.5,
                      angle: 90,
                    )
                  ],
              )],
            ),
          ),
        )),
    );
    
  }
}