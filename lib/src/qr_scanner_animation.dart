import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:qr_scanner/qr_scanner.dart';

class ImageScannerAnimation extends AnimatedWidget {
  final bool stopped;
  final QrScannerOverlayShape overlay;
  final AnimationController animation;
  final QrScannerOverlayAnimationTheme? scannerTheme;

  ImageScannerAnimation(
    this.animation,
    this.overlay, {
    this.stopped = false,
    this.scannerTheme = const QrScannerOverlayAnimationTheme(),
    Key? key,
  }) : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    Color color1;
    Color color2;

    int red;
    int green;
    int blue;
    bool isGradientApplicable;

    if (overlay.isInitialize) {
      red = scannerTheme!.color.red;
      blue = scannerTheme!.color.blue;
      green = scannerTheme!.color.green;
      isGradientApplicable = scannerTheme!.height > 2;

      var scorePosition = (animation.value * overlay.viewDimenstions!.height) +
          overlay.viewDimenstions!.top -
          scannerTheme!.height;
      if (scorePosition < overlay.viewDimenstions!.top) {
        scorePosition = overlay.viewDimenstions!.top;
        animation.forward();
      }

      if (animation.status == AnimationStatus.reverse) {
        color2 =
            Color.fromARGB(isGradientApplicable ? 0 : 255, red, green, blue);
        color1 =
            Color.fromARGB(isGradientApplicable ? 55 : 255, red, green, blue);
      } else {
        color2 =
            Color.fromARGB(isGradientApplicable ? 55 : 255, red, green, blue);
        color1 =
            Color.fromARGB(isGradientApplicable ? 0 : 255, red, green, blue);
      }

      return Positioned(
        top: scorePosition,
        left: overlay.viewDimenstions!.left,
        child: Opacity(
          opacity: (stopped) ? 0.0 : 1.0,
          child: Container(
            height: scannerTheme!.height,
            width: overlay.viewDimenstions!.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 1.0],
                colors: [color1, color2],
              ),
            ),
          ),
        ),
      );
    } else {
      return Container(); //Place Holder
    }
  }
}
