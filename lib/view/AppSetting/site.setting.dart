import 'package:flutter/material.dart';

class SiteSetting extends StatefulWidget {
  const SiteSetting({super.key});

  @override
  State<SiteSetting> createState() => _SiteSettingState();
}

class _SiteSettingState extends State<SiteSetting> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Site Setting"),);
  }
}
