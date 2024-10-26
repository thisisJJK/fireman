import 'package:fireman/model/record_model.dart';
import 'package:fireman/view/main/widget/btn.dart';
import 'package:fireman/view/main/widget/history_btn.dart';
import 'package:fireman/view_model/mode_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ModeView extends StatelessWidget {
  ModeView({super.key});
  final ModeViewModel _modeViewModel =
      Get.put(ModeViewModel(), permanent: true);
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
              ),
              Obx(
                () {
                  if (_modeViewModel.isLoaded.value) {
                    return SafeArea(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: SizedBox(
                          width: _modeViewModel.bannerAd.value!.size.width
                              .toDouble(),
                          height: _modeViewModel.bannerAd.value!.size.height
                              .toDouble(),
                          child: AdWidget(
                            ad: _modeViewModel.bannerAd.value!,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox(
                      height: 0,
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
