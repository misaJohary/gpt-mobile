import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/chat_bloc.dart';
import '../widgets/chat_body.dart';
import '../widgets/container_categories_widget.dart';
import '../widgets/custom_app_bar.dart';
import 'custom_drawer.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    context.read<ChatBloc>().add(ChatCategoriesFetched());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<ChatBloc, ChatState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            key: context.read<ChatBloc>().scaffoldKey,
            appBar: const CustomAppBar(),
            drawer: const CustomDrawer(),
            body: state.conversation == null
                ? const ContainerCategoriesWidget()
                : const ChatBody(),
          );
        },
      ),
    );
  }
}
