import 'package:badges/badges.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60);
}

Color startColor = Colors.transparent;
const targetColor = Colors.white;

Color startBgColor = Colors.transparent;
const endBgColor = Colors.white;

const startIconColor = Colors.white;
const targetIconColor = Colors.red;

Color startFlexIconColor = Colors.black;
const endFlexIconColor = Colors.black;

Color startFlexHintColor = Colors.grey;
Color endFlexHintColor = Colors.grey;

Color startFlexBgColor = const Color.fromARGB(255, 239, 239, 239);
Color endFlexBgColor = const Color.fromARGB(255, 239, 239, 239);

class _CustomAppBarState extends State<CustomAppBar> {
  final scrollController = ScrollController();

  final appBarColorTween = ColorTween(begin: startColor, end: targetColor);
  final iconColorTween =
      ColorTween(begin: startIconColor, end: targetIconColor);
  final bgColorTween = ColorTween(begin: startBgColor, end: endBgColor);
  final FlexIconColorTween =
      ColorTween(begin: startFlexIconColor, end: endFlexIconColor);
  final FlexHintColorTween =
      ColorTween(begin: startFlexHintColor, end: endFlexHintColor);
  final FlexBgColorTween =
      ColorTween(begin: startFlexBgColor, end: endFlexBgColor);

  double lerp = 0.0;
  Color get appBarColor => appBarColorTween.transform(lerp) ?? startColor;
  Color get iconColor => iconColorTween.transform(lerp) ?? startIconColor;
  Color get bgColor => bgColorTween.transform(lerp) ?? startBgColor;
  Color get flexIconColor =>
      FlexIconColorTween.transform(lerp) ?? startFlexIconColor;
  Color get flexHintColor =>
      FlexHintColorTween.transform(lerp) ?? startFlexHintColor;
  Color get flexBgColor => FlexBgColorTween.transform(lerp) ?? startFlexBgColor;

  @override
  void initState() {
    scrollController.addListener(listener);
    super.initState();
  }

  @override
  // ignore: must_call_super
  void dispose() {
    scrollController.removeListener(listener);
    super.initState();
  }

  void listener() {
    var offset = scrollController.offset;
    setState(() => lerp = offset < 300 ? offset / 300 : 1);
  }

  static const sizeIcon = BoxConstraints(
    minWidth: 40,
    minHeight: 40,
  );

  static const border = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.transparent,
      width: 0,
    ),
    borderRadius: BorderRadius.all(
      Radius.circular(4.0),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: appBarColor,
      title: GestureDetector(
        onTap: () {
          // Navigator.of(context).pushNamed(
          //   SearchClicked.routeName,
          // );

          // showSearch(context: context, delegate: MySearchDelegate());
        },
        child: Container(
          decoration: BoxDecoration(
              color: flexBgColor,
              border: Border.all(color: flexBgColor),
              borderRadius: BorderRadius.circular(4)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                GestureDetector(
                  // onTap: () => Routes.HOME,
                  child: Icon(
                    Icons.search,
                    size: 15,
                    color: flexIconColor,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  'Cari di Balbal',
                  style: TextStyle(
                    color: flexHintColor,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      actions: [
        Row(children: [
          Badge(
            toAnimate: true,
            animationType: BadgeAnimationType.slide,
            position: BadgePosition.topEnd(top: 5, end: 4),
            // badgeContent: Text(
            //   wp.wishListList.length.toString(),
            //   style: const TextStyle(color: Colors.white),
            // ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: bgColor,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {
                    // Navigator.of(context).pushNamed(ChatScreen.routeName);
                  },
                  icon: Icon(Icons.chat, color: iconColor),
                ),
              ),
            ),
          )
        ])
      ],
    );
  }
}
