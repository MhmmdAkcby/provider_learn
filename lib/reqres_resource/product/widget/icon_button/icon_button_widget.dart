import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_learn/reqres_resource/product/color/project_colors.dart';
import 'package:provider_learn/reqres_resource/product/global/theme_notifer.dart';

class IconButtonWidget extends StatefulWidget {
  const IconButtonWidget({super.key});

  @override
  State<IconButtonWidget> createState() => _IconButtonWidgetState();
}

class _IconButtonWidgetState extends State<IconButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<ThemeNotifer>().changeTheme();
        },
        icon: Icon(
          context.watch<ThemeNotifer>().isLightTheme ? Icons.nightlight_round_outlined : Icons.sunny,
          color: ProjectColors.whiteColor,
        ));
  }
}
