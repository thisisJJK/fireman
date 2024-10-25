import 'package:fireman/view/main/widget/btn.dart';
import 'package:fireman/view/main/widget/history_btn.dart';
import 'package:fireman/view_model/firewood_thanks_view_model.dart';
import 'package:flutter/material.dart';

class ModeView extends StatelessWidget {
  const ModeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Align(
                alignment: const Alignment(0, -1),
                child: Image.asset(
                  'assets/logo.png',
                  width: 100,
                  height: 100,
                ),
              ),
              
              const Align(
                alignment: Alignment(0, -0.6),
                child: Text(
                  '전부 태워버릴\n   준비됐어?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Align(
                alignment: Alignment(0, -0.1),
                child: Btn(
                  mode: Mode.firewood,
                ),
              ),
              const Align(
                alignment: Alignment(0, 0.3),
                child: Btn(
                  mode: Mode.thanks,
                ),
              ),
              const Align(
                alignment: Alignment(0, 0.65),
                child: HistoryBtn(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
