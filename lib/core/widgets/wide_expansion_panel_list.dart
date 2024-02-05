import 'package:flutter/material.dart';
import '../../../core/init/constants/color_constants.dart';

class WideExpansionPanelList extends StatefulWidget {
  final List<ExpansionPanelData> expansionPanelDataList;
  final double horizontalPadding;
  final double verticalPadding;

  const WideExpansionPanelList({
    super.key,
    required this.expansionPanelDataList,
    this.horizontalPadding = 10,
    this.verticalPadding = 10,
  });

  @override
  State<WideExpansionPanelList> createState() => _WideExpansionPanelListState();
}

class _WideExpansionPanelListState extends State<WideExpansionPanelList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: widget.horizontalPadding,
        vertical: widget.verticalPadding,
      ),
      child: Material(
        elevation: 4,
        shadowColor: ColorConstants.gallery,
        borderRadius: BorderRadius.circular(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: ExpansionPanelList(
            expansionCallback: (panelIndex, isExpanded) {
              setState(() {
                widget.expansionPanelDataList[panelIndex].isExpanded =
                    !isExpanded;
              });
            },
            children: widget.expansionPanelDataList
                .map<ExpansionPanel>((ExpansionPanelData item) {
              return wideExpansionPanel(
                title: item.title,
                body: item.body,
                isExpanded: item.isExpanded,
                header: item.header,
                subHeader: item.subHeader,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  ExpansionPanel wideExpansionPanel(
      {required Widget body,
      bool isExpanded = false,
      required title,
      required List<Widget> header,
      required List<Widget> subHeader}) {
    return ExpansionPanel(
        canTapOnHeader: true,
        isExpanded: isExpanded,
        headerBuilder: (context, isExpanded) {
          return Padding(
            padding: const EdgeInsets.only(left: 14.0, top: 10.0, bottom: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: title +
                  [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              alignment: WrapAlignment.spaceBetween,
                              direction: Axis.horizontal,
                              children: header +
                                  ((isExpanded &&
                                          MediaQuery.of(context).orientation ==
                                              Orientation.portrait)
                                      ? [const Divider()]
                                      : []) +
                                  ((isExpanded ||
                                          MediaQuery.of(context).orientation ==
                                              Orientation.landscape)
                                      ? subHeader
                                      : []) +
                                  ((isExpanded) ? [const Divider()] : [])),
                        ),
                      ],
                    ),
                  ],
            ),
          );
        },
        body: body);
  }
}

class ExpansionPanelData {
  ExpansionPanelData({
    required this.title,
    required this.header,
    required this.subHeader,
    required this.body,
    this.isExpanded = false,
  });

  List<Widget> title;
  List<Widget> header;
  List<Widget> subHeader;
  Widget body;
  bool isExpanded;
}
