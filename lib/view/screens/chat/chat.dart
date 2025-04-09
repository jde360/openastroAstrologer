import 'package:flutter/material.dart';
import 'package:open_astro/core/colors/color_pallet.dart';
import 'package:open_astro/view/ui_helper/ui_helper.dart';

import '../../../core/font/app_font.dart';
import '../../../service/image_provider.dart';
import '../../../service/svg_provider.dart';
import 'widgets/chatContainer.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: true,
        title: SizedBox(
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: AppImageProvider.asset(
                  asset: 'user1',
                  height: 45,
                  width: 45,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Rohan Das',
                      style: appText(size: 17, weight: FontWeight.w600),
                    ),
                    Text(
                      'Online',
                      style: appText(
                        size: 12,
                        weight: FontWeight.w400,
                        color: AppColor().chatColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgProvider.asset(asset: 'phone', color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgProvider.asset(asset: 'video', color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 34),
          child: Column(
            children: [
              Text(
                "Today",
                style: appText(
                  size: 13,
                  weight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const ChatContainer(isSender: true),
              const ChatContainer(isSender: false),
              const ChatContainer(isSender: true),
              const ChatContainer(isSender: false),
              const ChatContainer(isSender: true),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 18),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: Colors.white54),
          ),
          height: 60,
          width: percentWidth(),
          child: Row(
            children: [
              SizedBox(
                height: 60,
                width: percentWidth(percent: 80),
                child: TextFormField(
                  showCursor: false,

                  decoration: InputDecoration(
                    hintText: 'Type here...',
                    hintStyle: appText(
                      size: 15,
                      weight: FontWeight.w400,
                      color: Colors.white54,
                    ),
                    contentPadding: EdgeInsets.all(8),
                    border: InputBorder.none,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgProvider.asset(asset: 'send'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
