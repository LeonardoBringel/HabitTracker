import 'package:flutter/material.dart';
import 'package:habit_tracker/models/goal.dart';

class EditGoalPage extends StatefulWidget {
  const EditGoalPage({super.key});

  @override
  State<EditGoalPage> createState() => _EditGoalPageState();
}

class _EditGoalPageState extends State<EditGoalPage> {
  List<String> selectedDays = [];

  final nameFieldController = TextEditingController();
  final descriptionFieldController = TextEditingController();

  final List<List<DayButton>> listsOfDays = [
    [
      DayButton('MON'),
      DayButton('TUE'),
      DayButton('WED'),
      DayButton('THU'),
    ],
    [
      DayButton('FRI'),
      DayButton('SAT'),
      DayButton('SUN'),
    ],
  ];

  List<String> _getSelectedDays() {
    List<String> selectedDays = [];

    for (var listOfDays in listsOfDays) {
      for (var dayButton in listOfDays) {
        if (dayButton.isSelected) {
          selectedDays.add(dayButton.day);
        }
      }
    }
    return selectedDays;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Habit Tracker',
          style: TextStyle(fontSize: 32),
        ),
        centerTitle: true,
        leadingWidth: 80,
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            'Cancel',
            style: TextStyle(fontSize: 18),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(
              context,
              Goal(
                name: nameFieldController.text,
                description: nameFieldController.text,
                days: _getSelectedDays(),
                icon: Icons.auto_awesome,
                completedDates: [],
              ),
            ),
            child: const Text(
              'Done',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextFormField(
              controller: nameFieldController,
              style: const TextStyle(fontSize: 18),
              maxLength: 24,
              decoration: InputDecoration(
                hintText: 'My Goal',
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.yellow),
                    borderRadius: BorderRadius.circular(30)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.yellow),
                    borderRadius: BorderRadius.circular(30)),
                contentPadding: const EdgeInsets.all(25),
              ),
            ),
            TextFormField(
              controller: descriptionFieldController,
              style: const TextStyle(fontSize: 18),
              maxLength: 165,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'A short description of my goal',
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.yellow),
                    borderRadius: BorderRadius.circular(30)),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.yellow),
                    borderRadius: BorderRadius.circular(30)),
                contentPadding: const EdgeInsets.all(25),
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: listsOfDays[0],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: listsOfDays[1],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class DayButton extends StatefulWidget {
  DayButton(this.day, {super.key});

  final String day;
  bool isSelected = false;

  @override
  State<DayButton> createState() => _DayButtonState();
}

class _DayButtonState extends State<DayButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          widget.isSelected = !widget.isSelected;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor:
            widget.isSelected ? Colors.yellow.shade500 : Colors.grey.shade600,
      ),
      child: Text(widget.day),
    );
  }
}