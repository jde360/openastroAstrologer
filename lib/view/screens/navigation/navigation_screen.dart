import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_astro/core/font/app_font.dart';

import '../../widgets/space.dart';
import '../../widgets/user_card_widget.dart';
import '../../widgets/chat_tile_widget.dart';
import 'widgets/nav_bar_widget.dart';
import 'widgets/status_switch_button.dart';
import 'widgets/video_card_widget.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  List<String> switchList = ['phone', 'video', 'message'];
  final String thumbnail =
      'https://s3-alpha-sig.figma.com/img/b283/5891/58f870bf0940aff3e099b3032c91587d?Expires=1737936000&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=JiuoeaI22vXTc0nslszquZERj00Jc5zQuoVEeimOzFyqDEOhUI31~fdl9FZgQJSkrsnXOPd9Ign0Htmdkjq4odIDZSHrNEm9v9cGH2pcjJ72mP9LLh24o9e6rttIeZvXBBvNijQzW-su-eYpJjbAECc4Be-LSEmBn6dHtbqgargaYfr~uLWO~z0eMY5QD69Pgdr04bopNS-biJjdPBAr4dnjvvPK9LqQdUnwH5QFAmL1R8u3j6pPMSeXGSkCAFH~6VyCyHyRfVFSK4fwrnE-UThp5C6uB-kda7iyGheCDoyOEU-LAfslYPD3O-U0unq-HIDOcUvhvTMh2-NH7MWIYg__';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                space(height: 12, width: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StatusSwitchButton(
                      iconName: 'phone',
                      onTap: () {
                        _changeStatus('phone');
                      },
                      status: switchList.contains('phone'),
                    ),
                    StatusSwitchButton(
                      iconName: 'video',
                      onTap: () {
                        _changeStatus('video');
                      },
                      status: switchList.contains('video'),
                    ),
                    StatusSwitchButton(
                      iconName: 'message',
                      onTap: () {
                        _changeStatus('message');
                      },
                      status: switchList.contains('message'),
                    ),
                  ],
                ),
                space(height: 15, width: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Activity',
                      style: appText(size: 14, weight: FontWeight.w400),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                      ),
                    ),
                  ],
                ),
                const ChatTileWidget(
                  imageUrl: 'assets/images/user1.png',
                  isOnline: true,
                  name: 'Rohan Das',
                  subtitle: 'Hello How are you',
                ),
                const ChatTileWidget(
                  imageUrl: 'assets/images/user2.png',
                  isOnline: false,
                  name: 'Devika pathak',
                  subtitle: 'Hello How are you',
                ),
                const ChatTileWidget(
                  imageUrl: 'assets/images/user3.png',
                  isOnline: false,
                  name: 'Pooja Nathan',
                  subtitle: 'Hello How are you',
                ),
                const ChatTileWidget(
                  imageUrl: 'assets/images/user4.png',
                  isOnline: true,
                  name: 'Rajesh Srivastav',
                  subtitle: 'Hello How are you',
                ),
                space(height: 0, width: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Activity',
                      style: appText(size: 14, weight: FontWeight.w400),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      VideoCardWidget(id: '1', thumbnail: thumbnail),
                      VideoCardWidget(id: '1', thumbnail: thumbnail),
                      VideoCardWidget(id: '1', thumbnail: thumbnail),
                      VideoCardWidget(id: '1', thumbnail: thumbnail),
                      VideoCardWidget(id: '1', thumbnail: thumbnail),
                      VideoCardWidget(id: '1', thumbnail: thumbnail),
                      VideoCardWidget(id: '1', thumbnail: thumbnail),
                      VideoCardWidget(id: '1', thumbnail: thumbnail),
                      VideoCardWidget(id: '1', thumbnail: thumbnail),
                    ],
                  ),
                ),
                space(height: 15, width: 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Users',
                      style: appText(size: 14, weight: FontWeight.w400),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 16,
                      ),
                    ),
                  ],
                ),
                space(height: 15, width: 0),
                SizedBox(
                  width: double.infinity,
                  height: 220.h,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return UserCardWidget(
                        name: 'Rohan Das',
                        image: thumbnail,
                        id: '$index',
                      );
                    },
                  ),
                ),
                space(height: 15, width: 0),
              ],
            ),
          ),
        ),
        bottomNavigationBar: NavBarWidget(),
      ),
    );
  }

  void _changeStatus(String status) {
    log(status);
    if (switchList.contains(status)) {
      switchList.remove(status);
    } else {
      switchList.add(status);
    }
    setState(() {});
  }
}
