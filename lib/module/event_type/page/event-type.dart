import 'package:flutter/material.dart';

import '../../../global/widget/styles.dart';

import '../controller/event_type_controller.dart';

class EventType extends StatefulWidget {
  const EventType({
    Key? key,
    required this.data,
  }) : super(key: key);

  final Map<String, dynamic> data;

  @override
  State<EventType> createState() => _EventTypeState();
}

class _EventTypeState extends State<EventType> with AppStyleWidget {
  late final EventTypeController eventTypeController;

  @override
  void initState() {
    eventTypeController = EventTypeController(data: widget.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.keyboard_arrow_left),
            ),
          ),
          title: heading(context, text: "Event type", weight: FontWeight.w800),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              body(),
              button1(
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        heading(context,
                            text: "Create New",
                            weight: FontWeight.w600,
                            color: Colors.white)
                      ],
                    ),
                  ),
                  15),
            ],
          ),
        ),
      );

  Widget body() => Column(
        children: [
          button1(
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    heading(context, text: "Paid", color: Colors.white),
                    const Icon(Icons.keyboard_arrow_down_outlined,
                        color: Colors.white)
                  ],
                ),
              ),
              10,
              color: hexColor("F2994A")),
          sBox(context, 0.04),
          button1(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sBox(context, 0.02),
                  heading(context,
                      text: "Enter the price of event", scale: 0.9),
                  txtFieldContainer(context,
                      color: hexColor("f5f5f5"),
                      borderColor: Colors.transparent,
                      hintText: "1232")
                ],
              ),
              15,
              color: hexColor("F5F5F5")),
          sBox(context, 0.04),
          button1(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sBox(context, 0.03),
                  heading(context, text: "Location"),
                  sBox(context, 0.02),
                  button1(
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Row(
                          children: [
                            heading(context, text: "Remote"),
                          ],
                        ),
                      ),
                      10,
                      color: Colors.white),
                  sBox(context, 0.02),
                ],
              ),
              15,
              color: hexColor("F5F5F5")),
        ],
      );
}
