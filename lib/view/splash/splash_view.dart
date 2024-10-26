import 'package:fireman/service/ad_service.dart';
import 'package:fireman/view/main/mode_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/route_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<Offset> _animation;
  double _textOpacity = 1.0;

  @override
  void initState() {
    super.initState();
    adHelper().requestTrackingPermission();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -2.26),
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    Future.delayed(const Duration(seconds: 1), () {
      _animationController.forward();
    });

    SchedulerBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.off(() =>  ModeView(), transition: Transition.fadeIn);
      });
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _textOpacity = 0.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      body: Center(
        child: Stack(
          children: [
            //logo
            Align(
              alignment: const Alignment(0, -0.24),
              child: SlideTransition(
                position: _animation,
                child: Image.asset(
                  'assets/logo.png',
                  width: 100,
                  height: 100,
                ),
              ),
            ),

            //text
            SafeArea(
              child: Align(
                alignment: const Alignment(0, 0.65),
                child: AnimatedOpacity(
                  opacity: _textOpacity,
                  duration: const Duration(seconds: 1),
                  child: const Text(
                    '   시켜줘,\n감정소방관.',
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
