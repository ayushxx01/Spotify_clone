import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rockify/common/Widgets/appbar/basic_app_bar.dart';
import 'package:rockify/common/helpers/is_dark.dart';
import 'package:rockify/core/configs/assets/app_images.dart';
import 'package:rockify/core/configs/assets/app_vectors.dart';
import 'package:rockify/core/configs/theme/app_colors.dart';
import 'package:rockify/presentation/home/widgets/news_songs.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(
          hideBack: true,
          title: SvgPicture.asset(
            AppVectors.logo,
            height: 40,
            width: 40,
          )),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _homeTopCard(),
            _tabs(),
            SizedBox(
              height: 260,
              child: TabBarView(controller: _tabController, children: [
                NewsSongs(),
                Container(
                  decoration: const BoxDecoration(color: Colors.white),
                ),
                Container(),
                Container(),
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget _homeTopCard() {
    return Center(
      child: Container(
        height: 140,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(AppVectors.topCard)),
            Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(AppImages.buck)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _tabs() {
    return TabBar(
      controller: _tabController,
      labelColor: context.isDarkMode ? Colors.white : Colors.black,
      padding: const EdgeInsets.symmetric(
        vertical: 40,
        horizontal: 16,
      ),
      indicatorColor: AppColors.primary,
      tabs: const [
        Text(
          'Artists',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        Text(
          'Artists',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        Text(
          'Artists',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
        Text(
          'Artists',
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
        ),
      ],
    );
  }
}
