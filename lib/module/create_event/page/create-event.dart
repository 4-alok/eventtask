import 'package:eventtask/global/widget/styles.dart';
import 'package:flutter/material.dart';

import '../controller/create_event_controller.dart';
import '../../event_type/page/event-type.dart';

class CreateEvent extends StatefulWidget {
  const CreateEvent({Key? key}) : super(key: key);

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> with AppStyleWidget {
  final createEventController = CreateEventController();

  @override
  void dispose() {
    createEventController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.keyboard_arrow_left),
          ),
          title: heading(
            context,
            text: "Create New Event",
            weight: FontWeight.w800,
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                uploadFileWidget,
                sBox(context, 0.03),
                heading(
                  context,
                  text: "TITLE",
                  weight: FontWeight.w500,
                  color: hexColor("565656"),
                ),
                sBox(context, 0.015),
                txtFieldContainer(
                  context,
                  controller: createEventController.titleController,
                  color: hexColor("f5f5f5"),
                  borderColor: hexColor("F5F5F5"),
                  hintText: "Type something",
                  hintColor: Colors.black45,
                ),
                sBox(context, 0.03),
                heading(context,
                    text: "DESCRIPTION",
                    weight: FontWeight.w500,
                    color: hexColor("565656")),
                sBox(context, 0.015),
                txtFieldContainer(context,
                    color: hexColor("f5f5f5"),
                    controller: createEventController.descriptionController,
                    borderColor: hexColor("F5F5F5"),
                    hintText: "Type something",
                    hintColor: Colors.black45,
                    maxLines: 6),
                sBox(context, 0.03),
                dateWidget,
                sBox(context, 0.05),
                nextWidget(context)
              ],
            ),
          ),
        ),
      );

  Widget nextWidget(BuildContext context) => navigate(
        context: context,
        page: EventType(data: createEventController.getData),
        child: button1(
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                heading(context,
                    text: "Next", weight: FontWeight.w600, color: Colors.white)
              ],
            ),
          ),
          15,
        ),
      );

  Widget get dateWidget => button1(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sBox(context, 0.03),
            heading(context, text: "Starting date and time"),
            sBox(context, 0.02),
            button1(
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ValueListenableBuilder(
                    valueListenable: createEventController.startingDate,
                    builder: (context, date, child) => heading(context,
                        text: date == null
                            ? "Right after listing"
                            : date.toString().substring(0, 10)),
                  ),
                  const Icon(Icons.keyboard_arrow_down_outlined)
                ],
              ),
              10,
              color: Colors.white,
              onTap: () => createEventController.pickStartingDate(context),
            ),
            sBox(context, 0.03),
            heading(context, text: "Ending date and time"),
            sBox(context, 0.02),
            button1(
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ValueListenableBuilder(
                    valueListenable: createEventController.endDate,
                    builder: (context, date, child) => heading(context,
                        text: date == null
                            ? "Select date"
                            : date.toString().substring(0, 10)),
                  ),
                  const Icon(Icons.keyboard_arrow_down_outlined)
                ],
              ),
              10,
              color: Colors.white,
              onTap: () => createEventController.pickEndDate(context),
            ),
            sBox(context, 0.02),
          ],
        ),
        15,
        color: hexColor("F5F5F5"),
      );

  Widget get uploadFileWidget => Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Material(
          borderRadius: BorderRadius.circular(15),
          color: hexColor("F5F5F5"),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () => createEventController.pickImage(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                aImage("upload-file", scale: 2),
                sBox(context, 0.015),
                heading(context, text: "Upload your file here")
              ],
            ),
          ),
        ),
      );
}
