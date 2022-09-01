import 'package:example_app/app/presentation/components/application_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DonatePage extends StatelessWidget {
  const DonatePage({Key? key}) : super(key: key);

  openLink() async {
    Uri uri = Uri.parse('https://www.linkedin.com/in/lojhan/');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const ApplicationBar(),
      body: Center(
        child: InkWell(
          onTap: openLink,
          child: Image.asset('assets/bmc-new-logo.png', width: 200),
        ),
      ),
    );
  }
}
