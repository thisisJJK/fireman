import 'package:fireman/view/fire/fire_view.dart';
import 'package:fireman/view_model/firewood_thanks_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';

class FirewoodThanksView extends StatelessWidget {
  final Mode mode;
  FirewoodThanksView({super.key, required this.mode});
  final FirewoodThanksViewModel _firewoodThanksViewModel =
      Get.put(FirewoodThanksViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Center(
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Align(
                    alignment: const Alignment(0, -1),
                    child: Image.asset(
                      'assets/logo.png',
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, -0.65),
                  child: Text(
                    mode == Mode.firewood
                        ? '어떤 감정을 태워줄까?'
                        : '긍정적인 말이나\n감사한 일 적어줘!',
                    style: const TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, -0.2),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                    ),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        TextField(
                          autofocus: true,
                          expands: true,
                          maxLines: null,
                          minLines: null,
                          controller:
                              _firewoodThanksViewModel.textEditingController,
                          decoration: InputDecoration(
                            hintText: '불태워 없앨 안좋은 기억이나 \n경험을 적어보세요.',
                            hintStyle: const TextStyle(fontSize: 18),
                            filled: true,
                            fillColor: mode == Mode.firewood
                                ? Theme.of(context)
                                    .colorScheme
                                    .secondaryContainer
                                : Theme.of(context)
                                    .colorScheme
                                    .tertiaryContainer,
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            isDense: true,
                            contentPadding: const EdgeInsets.all(15),
                          ),
                          style: TextStyle(
                            color: mode == Mode.firewood
                                ? Theme.of(context)
                                    .colorScheme
                                    .onSecondaryContainer
                                : Theme.of(context)
                                    .colorScheme
                                    .onTertiaryContainer,
                            fontSize: 21,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.to(
                              () => FireView(),
                              transition: Transition.fadeIn,
                            );
                          },
                          icon: const Icon(
                            FeatherIcons.send,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
