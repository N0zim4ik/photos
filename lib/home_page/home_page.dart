import 'package:flutter/material.dart';
import 'package:photos/home_page/repository/photos_repository.dart';
import 'package:photos/home_page/widgets/photos.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController controller;

  Repository repository = Repository();

  List<String> pageOne = [];
  List<String> pageTwo = [];
  List<String> pageThree = [];
  int onePage = 1;
  int twoPage = 1;
  int threePage = 1;

  @override
  void initState() {
    controller = TabController(length: 3, vsync: this);
    getData();
    super.initState();
  }

  void getData() async {
    pageOne = (await repository.getData(onePage, 'dogs'))
            ?.results!
            .map((e) => e.urls?.regular ?? '')
            .toList() ??
        [];
    pageTwo = (await repository.getData(onePage, 'cars'))
            ?.results!
            .map((e) => e.urls?.regular ?? '')
            .toList() ??
        [];
    pageThree = (await repository.getData(onePage, 'office'))
            ?.results!
            .map((e) => e.urls?.regular ?? '')
            .toList() ??
        [];
    setState(() {});
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TabBar(
              indicatorColor: Colors.blue,
              labelColor: Colors.black,
              controller: controller,
              tabs: [
                Tab(text: 'Dogs'),
                Tab(text: 'Cars'),
                Tab(text: 'Office'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: [
                  Photos(photos: pageOne),
                  Photos(photos: pageTwo),
                  Photos(photos: pageThree),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (controller.index == 0) {
            onePage++;
            pageOne.addAll((await repository.getData(onePage, 'dogs'))
                    ?.results!
                    .map((e) => e.urls?.regular ?? '')
                    .toList() ??
                []);
            setState(() {});
          } else if (controller.index == 1) {
            twoPage++;
            pageTwo.addAll((await repository.getData(twoPage, 'cars'))
                    ?.results!
                    .map((e) => e.urls?.regular ?? '')
                    .toList() ??
                []);
            setState(() {});
          } else if (controller.index == 2) {
            threePage++;
            pageThree.addAll((await repository.getData(threePage, 'office'))
                    ?.results!
                    .map((e) => e.urls?.regular ?? '')
                    .toList() ??
                []);
            setState(() {});
          }
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
