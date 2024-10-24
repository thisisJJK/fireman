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
      backgroundColor: Colors.black,
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
              alignment: Alignment(0, -0.15),
              child: Text(
                '분노,짜증,억울함으로',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const Align(
              alignment: Alignment(0, 0),
              child: Btn(
                mode: Mode.firewood,
                text: '🪵   감정땔감 만들기   ',
              ),
            ),
            const Align(
              alignment: Alignment(0, 0.19),
              child: Text(
                '긍정과 감사 한 마디로',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            const Align(
              alignment: Alignment(0, 0.35),
              child: Btn(
                mode: Mode.thanks,
                text: '🧯 감정소화기 만들기  ',
              ),
            ),
            const Align(
              alignment: Alignment(0, 0.65),
              child: HistoryBtn(),
            )
          ],
        )),
      ),
    );
  }
}
