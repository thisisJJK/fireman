import 'package:fireman/service/ad_service.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class ModeViewModel extends GetxController {
  final bannerAd = Rxn<BannerAd>();
  final isLoaded = false.obs;
  @override
  void onInit() {
    loadAd();
    super.onInit();
  }

  void loadAd() async {
    adHelper().configureAdSettings(
        (ad) => {
              if (bannerAd.value == null)
                {
                  bannerAd.value = ad,
                  isLoaded.value = true,
                },
            },
        BannerType.small);
  }
}
