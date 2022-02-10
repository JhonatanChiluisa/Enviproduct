import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
class VelocimetroWidget extends StatelessWidget {
  const VelocimetroWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Center(
              child: SfRadialGauge(
                title: const GaugeTitle(text: ' '),
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
           const ListTile(
             leading: Padding(
               padding: EdgeInsets.only(left: 60.0),
               child: Icon(
                Icons.location_on_outlined,
                size: 60.0,
              ),
             ),
             trailing: Padding(
               padding: EdgeInsets.only(right: 60.0),
               child: Icon(
                Icons.speed,
                size: 60.0,
              ),
             ),
           ),
           const ListTile(
             leading: Padding(
               padding: EdgeInsets.only(left: 60.0),
               child: Text("180 KM"),
             ),

             trailing: Padding(
               padding: EdgeInsets.only(right: 68.0),
               child: Text("90 KM"),
             ),
           ),
           
          ],
        ),
      ));
    
  }
}