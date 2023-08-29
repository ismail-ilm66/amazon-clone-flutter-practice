import 'package:amazon_clone/common/widgets/loadingBar.dart';
import 'package:amazon_clone/features/admin/services/admins_services.dart';
import 'package:amazon_clone/models/sales.dart';
import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/ordinal/bar.dart';
import 'package:flutter/material.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  AdminServices adminServices = AdminServices();
  List<Sales>? sales;
  int totalEarnings = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEarinings();
  }

  void getEarinings() async {
    final data = await adminServices.getAnalytiics(context);
    var x = data['sales'];
    sales = List<Sales>.from(x);
    totalEarnings = data['totalEarnings'];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: sales == null
          ? const Center(
              child: LoadingBarWidget(),
            )
          : SizedBox(
              height: 250,
              child: DChartBarO(
                animate: true,
                groupList: [
                  OrdinalGroup(
                    id: '1',
                    data: [
                      for (int i = 0; i < sales!.length; i++)
                        OrdinalData(
                            domain: sales![i].label,
                            measure: sales![i].earnings),
                    ],
                  )
                ],
              ),
            ),
    );
  }
}
