import 'package:flutter/material.dart';
import 'package:open_astro/view/widgets/appbar.dart';

import '../../widgets/chat_tile_widget.dart';

class ChatParticipents extends StatelessWidget {
  const ChatParticipents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: 'Chat'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(itemBuilder: (context, index) {
          return ChatTileWidget(
            imageUrl: 'assets/images/user3.png',
            isOnline: false,
            name: 'Pooja Nathan',
            subtitle: 'Hello How are you',
          );
        }),
      ),
    );
  }
}
