import 'package:auto_route/annotations.dart';
import 'package:easy_cook/core/utils/app_images.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 100,
              child: Stack(
                // alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                        color: Colors.orangeAccent,
                        // gradient:LinearGradient(
                        //     end: Alignment.bottomLeft,
                        //     begin: Alignment.topRight,
                        //     colors:  [
                        //
                        //   Colors.indigoAccent,
                        //   Colors.indigo.shade700,
                        //   Colors.indigo.shade700,
                        // ]),
                        borderRadius: BorderRadius.circular(16)),
                    child: const Row(),
                  ),
                  Positioned(
                      right: 4,
                      child: SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset(
                          alignment: Alignment.topRight,
                          AppImages.vegeIcon,
                          // fit: BoxFit.fitHeight,
                        ),
                      )),
                  Positioned(
                      left: 16,
                      top: 0,
                      bottom: 0,
                      child: Center(
                          child: Text(
                        'Our new store is\navailable try it.',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: Colors.white),
                      )))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
