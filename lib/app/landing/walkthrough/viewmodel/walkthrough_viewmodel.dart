import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../app/landing/walkthrough/model/walkthrough_model.dart';
import '../../../../core/base/viewmodel/base_viewmodel.dart';
import '../../../../core/init/language/locale_keys.g.dart';
import '../../../../core/extensions/string_extension.dart';

class WalkthroughViewModel extends BaseViewModel {
  @override
  FutureOr<void> init() {}

  List<WalkthroughModel> get walkthroughList => [
        WalkthroughModel(
            id: 1,
            title: '',
            description:
                LocaleKeys.walkthrough_printflowDescriptionLabelText.locale,
            image: 'assets/images/yeni.png'),
        WalkthroughModel(
          id: 2,
          title: LocaleKeys.walkthrough_makeAnOfferLabelText.locale,
          description:
              LocaleKeys.walkthrough_makeAnOfferDescriptionLabelText.locale,
          image: 'assets/images/make_offer.png',
        ),
        WalkthroughModel(
          id: 3,
          title: LocaleKeys.walkthrough_openAnOrderLabelText.locale,
          description:
              LocaleKeys.walkthrough_openAnOrderDescriptionLabelText.locale,
          image: 'assets/images/open_order.png',
        ),
        WalkthroughModel(
          id: 4,
          title: LocaleKeys.walkthrough_planningLabelText.locale,
          description:
              LocaleKeys.walkthrough_planningDescriptionLabelText.locale,
          image: 'assets/images/planning.png',
        ),
        WalkthroughModel(
          id: 5,
          title: LocaleKeys.walkthrough_produceLabelText.locale,
          description:
              LocaleKeys.walkthrough_produceDescriptionLabelText.locale,
          image: 'assets/images/produce.png',
        ),
        WalkthroughModel(
          id: 6,
          title: LocaleKeys.walkthrough_sendLabelText.locale,
          description: LocaleKeys.walkthrough_sendDescriptionLabelText.locale,
          image: 'assets/images/send.png',
        ),
      ];

  @override
  void clearFilter() {}

  @override
  void applyFilter(BuildContext context) {}

  @override
  void applySearch(String value) {}
}
