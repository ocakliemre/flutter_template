import 'package:flutter/material.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/init/constants/animation_constants.dart';
import '../../../core/init/constants/color_constants.dart';
import '../../../core/init/constants/widget_constants.dart';

// ignore: must_be_immutable
class CustomDraggableScrollableSheet extends StatefulWidget {
  CustomDraggableScrollableSheet({
    super.key,
    required this.child,
    this.maxChildSize,
    this.minChildSize,
    this.initialChildSize,
    this.snap = true,
    this.snapSizes,
    this.snapSizesWithWidgetKeys,
    this.backgroundColor,
    required this.scrollChanged,
    this.startUpAnimation = false,
  });

  @override
  State<CustomDraggableScrollableSheet> createState() =>
      _CustomDraggableScrollableSheetState();

  final Widget child;
  final bool snap;
  final Color? backgroundColor;
  final ValueChanged<DraggableScrollableController> scrollChanged;
  final bool startUpAnimation;
  double? maxChildSize;
  double? minChildSize;
  double? initialChildSize;
  List<double>? snapSizes;
  List<GlobalKey>? snapSizesWithWidgetKeys;
}

class _CustomDraggableScrollableSheetState
    extends State<CustomDraggableScrollableSheet> {
  double padding = 5.0;
  List<double>? _snapSizes;
  bool _isLoaded = false;
  Orientation _orientation = Orientation.portrait;

  DraggableScrollableController draggableScrollableController =
      DraggableScrollableController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      updateSnapSizes();

      if (widget.startUpAnimation) {
        startUpAnimation();
      }
      setState(() {});
    });

    draggableScrollableController.addListener(() {
      widget.scrollChanged(draggableScrollableController);
    });
  }

  @override
  Widget build(BuildContext context) {
    updateSnapSizes();

    return !_isLoaded
        ? Container()
        : OrientationBuilder(
            builder: (context, orientation) {
              if (orientation != _orientation) {
                _orientation = orientation;
              }
              return DraggableScrollableSheet(
                  controller: draggableScrollableController,
                  expand: true,
                  snapAnimationDuration: const Duration(milliseconds: 100),
                  maxChildSize: widget.maxChildSize ?? 1.0,
                  minChildSize: widget.minChildSize ??
                      ((widget.snapSizes?.firstOrNull ??
                              _snapSizes?.firstOrNull) ??
                          0.4),
                  initialChildSize: widget.initialChildSize ??
                      ((widget.snapSizes?.firstOrNull ??
                              _snapSizes?.firstOrNull) ??
                          1.0),
                  snap: widget.snap,
                  snapSizes: widget.snapSizes ?? _snapSizes,
                  builder: (context, scrollController) {
                    return Container(
                        decoration: BoxDecoration(
                          color: widget.backgroundColor,
                          gradient: widget.backgroundColor != null
                              ? null
                              : const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                      ColorConstants.icyLilac,
                                      ColorConstants.drWhite,
                                    ]),
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.elliptical(
                                WidgetConstants.borderRadius1,
                                WidgetConstants.borderRadius2),
                          ),
                        ),
                        child: Column(
                          children: [
                            buildNotch(),
                            Expanded(
                              child:
                                  buildSingleChildScrollView(scrollController),
                            ),
                          ],
                        ));
                  });
            },
          );
  }

  SingleChildScrollView buildSingleChildScrollView(
      ScrollController scrollController) {
    return SingleChildScrollView(
      controller: scrollController,
      child: buildDraggableScrollableBody(),
    );
  }

  Container buildDraggableScrollableBody() {
    return Container(
      padding: EdgeInsets.only(
        right: padding,
        left: padding,
        bottom: context.bottomPadding,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.all(WidgetConstants.padding4),
            child: widget.child,
          ),
        ],
      ),
    );
  }

  Widget buildNotch() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 5.0),
      child: Container(
        width: 35,
        height: 4,
        margin: const EdgeInsets.all(WidgetConstants.padding5),
        decoration: BoxDecoration(
          color: ColorConstants.sinbad,
          borderRadius: BorderRadius.circular(WidgetConstants.borderRadius6),
        ),
      ),
    );
  }

  /// Gönderilen widget listesindeki elemanların altına denk gelen konumların
  /// ekran yüksekliğinin yüzde kaçına denk geldiğini hesaplayarak bu değerleri liste olarak döndürür.
  /// Snapsize değerleri DraggableScrollableSheet widgetının hangi noktalarda duracağını belirtir.
  List<double> calculateSnapPoints({
    required BuildContext context,
    required List<GlobalKey> widgetKeys,
  }) {
    List<double> snapSizes = [];

    // debugPrint('screenHeight: ${context.screenHeight}');
    // debugPrint('appBarPercent: ${context.appBarPercent}');
    // debugPrint('topPaddingPercent: ${context.topPaddingPercent}');
    // debugPrint('bottomPaddingPercent: ${context.bottomPaddingPercent}');
    // debugPrint('safeArea: ${context.safeArea}');
    // debugPrint('topPadding: ${context.topPadding}');
    // debugPrint('safeAreaHeightTop: ${context.safeAreaHeightTop}');
    // debugPrint('safeAreaHeightBottom: ${context.safeAreaHeightBottom}');
    // debugPrint('safeAreaHeight: ${context.safeAreaHeight}');
    // debugPrint('appBarHeight: ${context.appBarHeight}');
    // debugPrint('screenHeightMinusSafeAreaAndAppBar: ${context.screenHeightMinusSafeAreaAndAppBar}');
    // debugPrint('usableScreenHeight: ${context.usableScreenHeight}');

    //Konum ve boyut alma işlemleri:
    for (var element in widgetKeys) {
      try {
        final RenderBox renderBox =
            element.currentContext?.findRenderObject() as RenderBox;
        Offset? location = renderBox.localToGlobal(Offset.zero);
        Size size = renderBox.size;

        debugPrint(
            'Widget: ${element.toString()} - Location: ${location.toString()} - Size: ${size.toString()}');

        //Hesaplama:
        final double snapPoint = 1 -
            ((location.dy + size.height - context.appBarHeight) /
                context.usableScreenHeight);

        snapSizes.add(snapPoint);

        debugPrint('CalculatedSnapPoint: $snapPoint');
      } catch (e) {}
    }

    snapSizes.sort((a, b) => a.compareTo(b));

    return snapSizes;
  }

  ///Sayfa ilk yüklendiğinde scrollun yukarı kaydırılması anımasyonu.
  void startUpAnimation() {
    Future.delayed(AnimationConstants.duration5).then((value) {
      if (_isLoaded && draggableScrollableController.isAttached) {
        if (_snapSizes?.isNotEmpty ?? false) {
          draggableScrollableController.animateTo(1.0,
              duration: AnimationConstants.duration10,
              curve: AnimationConstants.curve1);
        }
      }
    });
  }

  ///Snap Size'ların hesaplanması.
  void updateSnapSizes() {
    _isLoaded = false;

    if (widget.snapSizesWithWidgetKeys?.isNotEmpty ?? false) {
      _snapSizes = calculateSnapPoints(
          context: context, widgetKeys: widget.snapSizesWithWidgetKeys!);
    }

    _isLoaded = true;
  }
}
