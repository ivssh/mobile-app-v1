// home screen contents
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/shared/models/posts.dart';
import 'package:flutter_starter/widgets/custom_bottom_app_bar.dart';
import 'package:flutter_starter/widgets/custom_video_player.dart';
import 'package:go_router/go_router.dart';

import '../../common_export.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final AuthenticationBloc authenticationBloc;
  List<Post> posts = Post.posts;
  bool switchValue = false;

  @override
  void initState() {
    super.initState();
    authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    authenticationBloc.add(const GetUserData());
    switchValue = BlocProvider.of<UpdateThemeBloc>(context).state.props.first ==
            AppTheme.light
        ? false
        : true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        bloc: authenticationBloc,
        listener: (context, state) {
          if (state is UserLogoutState) {
            context.go('/login');
          }
        },
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            bloc: authenticationBloc,
            builder: (BuildContext context, AuthenticationState state) {
              if (state is SetUserData) {
                var posts=[];
                return Scaffold(
                  appBar: _CustomAppBar(authenticationBloc: authenticationBloc),
                  bottomNavigationBar: const CustomBottomAppBar(),
                  backgroundColor: Colors.black,
                  extendBodyBehindAppBar: true,
                  body: SingleChildScrollView(
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                      children: posts.map((post) {
                        return CustomVideoPlayer(post: post);
                      }).toList(),
                    ),
                  ),
                );
              }
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const _CustomAppBar({
    Key? key,
    required this.authenticationBloc,
  }) : super(key: key);

  final AuthenticationBloc authenticationBloc;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildAppBarButton(context, 'For You'),
          _buildAppBarButton(context, 'Following'),
        ],
      ),
      actions: [
        IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              authenticationBloc.add(const UserLogOut());
            }),
      ],
    );
  }

  TextButton _buildAppBarButton(BuildContext context, String text) {
    return TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(fixedSize: const Size(100, 50)),
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
          ),
        ));
  }
  
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(56.0);
}
