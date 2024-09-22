import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:hundred_days/utils/dialog_box.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> dailyTasks = [];

  List<Map<String, dynamic>> additionalTasks = [];

  @override
  Widget build(BuildContext context) {
    // Calculate progress (tasks completed / total tasks)
    int totalTasks = dailyTasks.length;
    int completedTasks =
        dailyTasks.where((task) => task['completed'] == true).length;
    double taskCompletion = completedTasks / totalTasks;

    int daysLeft = DateTime(2025, 1, 1).difference(DateTime.now()).inDays;

    return Scaffold(
      body: Row(
        children: [
          // Transparent Navigation Rail
          NavigationRail(
            minWidth: MediaQuery.of(context).size.width * 0.15,
            groupAlignment: 0,
            backgroundColor:
                const Color.fromARGB(255, 127, 127, 127).withOpacity(0.1),
            selectedIndex: 0,

            onDestinationSelected: (int index) {
              if (index == 1) {
                // Navigate to Record Screen
              } else if (index == 2) {
                // Navigate to Settings Screen
              }
            },
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.assessment),
                label: Text('Record'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.settings),
                label: Text('Settings'),
              ),
            ],
            //  selectedLabelTextStyle: TextStyle(color: Colors.blue),
            //unselectedLabelTextStyle: TextStyle(color: Colors.blueAccent),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInDown(
                    delay: const Duration(milliseconds: 500),
                    duration: const Duration(milliseconds: 1000),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 1,
                              color: Colors.grey,
                              offset: Offset(0, 5))
                        ],
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Days left for New Year
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '$daysLeft',
                                  style: TextStyle(
                                    fontFamily: 'Manrope',
                                    fontSize: 50,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue,
                                  ),
                                ),
                                Text(
                                  'days left for new year',
                                  style: TextStyle(
                                    fontFamily: 'Manrope',
                                    fontSize: 16,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                            // Circular progress indicator
                            CircularPercentIndicator(
                              radius: 60.0,
                              lineWidth: 8.0,
                              percent: taskCompletion,
                              center: new Text(
                                "${(taskCompletion * 100).toStringAsFixed(0)}%",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.blue,
                                  fontFamily: 'Manrope',
                                ),
                              ),
                              progressColor: Colors.blue,
                              backgroundColor: Colors.grey[300]!,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Daily Tasks:\n",
                    style: TextStyle(
                        fontFamily: 'Manrope',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  // Daily Tasks list
                  // Daily Tasks list
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: dailyTasks.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Dismissible(
                            key: Key(dailyTasks[index]['task']),
                            direction: DismissDirection.startToEnd,
                            onDismissed: (direction) {
                              setState(() {
                                dailyTasks.removeAt(index);
                              });
                            },
                            background: Container(
                              color: Colors.red,
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Icon(Icons.delete, color: Colors.white),
                            ),
                            child: CheckboxListTile(
                              title: Text(
                                dailyTasks[index]['task'],
                                style: TextStyle(
                                  decoration:
                                      dailyTasks[index]['completed'] == true
                                          ? TextDecoration.lineThrough
                                          : TextDecoration.none,
                                  color: dailyTasks[index]['completed'] == true
                                      ? Colors.grey
                                      : Colors.black,
                                ),
                              ),
                              value: dailyTasks[index]['completed'] ?? false,
                              onChanged: (bool? value) {
                                setState(() {
                                  dailyTasks[index]['completed'] = value!;
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),

// Additional Tasks list
                  Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: additionalTasks.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Dismissible(
                            key: Key(additionalTasks[index]['task']),
                            direction: DismissDirection.startToEnd,
                            onDismissed: (direction) {
                              setState(() {
                                additionalTasks.removeAt(index);
                              });
                            },
                            background: Container(
                              color: Colors.red,
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Icon(Icons.delete, color: Colors.white),
                            ),
                            child: CheckboxListTile(
                              title: Text(
                                additionalTasks[index]['task'],
                                style: TextStyle(
                                  decoration: additionalTasks[index]
                                              ['completed'] ==
                                          true
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                  color: additionalTasks[index]['completed'] ==
                                          true
                                      ? Colors.grey
                                      : Colors.black,
                                ),
                              ),
                              value:
                                  additionalTasks[index]['completed'] ?? false,
                              onChanged: (bool? value) {
                                setState(() {
                                  additionalTasks[index]['completed'] = value!;
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Create a new TextEditingController
          final _controller = TextEditingController();

          // Show the dialog box
          showDialog(
            context: context,
            builder: (context) {
              return DialogBox(
                Controller: _controller,
                onSave: () {
                  setState(() {
                    additionalTasks
                        .add({'task': _controller.text, 'completed': false});
                  });
                  Navigator.of(context).pop();
                },
                onCancel: () {
                  Navigator.of(context).pop();
                },
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
