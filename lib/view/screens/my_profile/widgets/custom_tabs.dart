import 'package:flutter/material.dart';
import 'package:open_astro/view/ui_helper/ui_helper.dart';

import '../../../../service/image_provider.dart';
import '../screens/info.dart';

class CustomTabs extends StatelessWidget {
  const CustomTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            TabBar(
              dividerColor: Colors.transparent,
              tabAlignment: TabAlignment.center,
              isScrollable: true,
              tabs: <Widget>[
                Tab(
                  child: SizedBox(
                    width: percentWidth(percent: 24),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: AppImageProvider.asset(
                        asset: 'description',
                        height: 20,
                        width: 20,
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: SizedBox(
                    width: percentWidth(percent: 24),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: AppImageProvider.asset(asset: 'Reels', height: 20),
                    ),
                  ),
                ),
                Tab(
                  child: SizedBox(
                    width: percentWidth(percent: 24),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: AppImageProvider.asset(
                        asset: 'Review',
                        height: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [InfoScreen(), Text("Reels"), Text("Review")],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
