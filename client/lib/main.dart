import 'package:flutter/material.dart';
import 'package:flutter_web_chartjs/chartjs.models.dart';
import 'package:flutter_web_chartjs/chartjs.wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ChartData _chartData;
  List<ChartAxis> _chartxAxes;
  final chartData1 = ChartData(labels: [
    '4/6 AM',
    '4/6 PM',
    '4/7 AM',
    '4/7 PM',
    '4/8 AM',
    '4/8 PM',
    '4/9 AM',
    '4/9 PM',
    '4/10 AM',
    '4/10 PM',
    '4/11 AM',
    '4/11 PM',
    '4/12 ',
  ], datasets: [
    ChartDataset(
        data: [83,80,76,72,69,65,61,56,52,54,44,41,110],
        label: '島民A',
        backgroundColor: Colors.blue.withOpacity(0.4)),
    ChartDataset(
        data: [123,90,104,105,105,72,66,59,119,62,58,102,95],
        label: '島民B',
        backgroundColor: Colors.yellow.withOpacity(0.4)),
    ChartDataset(
        data: [95,91,87,106,152,481,211,111,59,79,79,85,90],
        label: '島民C',
        backgroundColor: Colors.red.withOpacity(0.4)),
  ]);


  List<ChartAxis> chartxAxes1 = [
    ChartAxis(
      type: ChartCartesianAxisType.category,
    )
  ];

  @override
  void initState() {
    super.initState();
    _chartData = chartData1;
    _chartxAxes = chartxAxes1;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Turniprice Visualizer'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: <Widget>[
              Expanded(
                child: ChartJS(
                  id: 'line-example',
                  config: ChartConfig(
                      type: ChartType.line,
                      options: ChartOptions(
                          animationConfiguration: ChartAnimationConfiguration(
                            duration: Duration(milliseconds: 1200),
                            easing: ChartEasing.easeOutQuart,
                          ),
                          scales: ChartScales(
                            xAxes: _chartxAxes,
                          ),
                          tooltip: ChartTooltip(
                              intersect: false,
                              mode: ChartTooltipMode.isIndex,
                              callbacks: ChartCallbacks(label: (tooltip) {
                                return 'R\$ ${tooltip.value}';
                              }))),
                      data: _chartData),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}