import 'package:day3/models/customButtom.dart';
import 'package:day3/models/customTextfiled.dart';
import 'package:flutter/material.dart';
import 'package:day3/Screans/login.dart';

class AddTasks extends StatefulWidget {
  final String username; 

  const AddTasks({super.key, required this.username});

  @override
  State<AddTasks> createState() => _AddTasksState();
}

class _AddTasksState extends State<AddTasks> {
  bool isActive = false;
  List<Map<String, dynamic>> tasks = [];
  final TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = isActive ? Colors.black : Colors.white;
    Color textColor = isActive ? Colors.white : Colors.black;
    Color subTextColor = isActive ? Colors.grey : Colors.grey[800]!;
    Color cardColor = isActive ? Colors.grey[800]! : Colors.grey[300]!;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        iconTheme: IconThemeData(color: textColor),
        title: Text(
          "Daily Tasks",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: textColor,
          ),
        ),
        elevation: 0,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[850],
        child: ListView(
          children: [
            DrawerHeader(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                          "assets/images/Mask group.png",
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        widget.username,
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              margin: EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                color: Colors.grey[700],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  '${tasks.where((task) => !task['isChecked']).length} Task left',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 12),
                              margin: EdgeInsets.only(left: 5),
                              decoration: BoxDecoration(
                                color: Colors.grey[700],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  '${tasks.where((task) => task['isChecked']).length} Task done',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.white),
              title: Text('Setting', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.person, color: Colors.white),
              title: Text(
                'Change account name',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.key, color: Colors.white),
              title: Text(
                'Change account password',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.camera_alt, color: Colors.white),
              title: Text(
                'Change account Image',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                isActive ? Icons.nightlight_round : Icons.sunny,
                color: Colors.white,
              ),
              title: Text('Theme', style: TextStyle(color: Colors.white)),
              trailing: Switch(
                value: isActive,
                activeColor: Colors.cyanAccent,
                inactiveTrackColor: Colors.cyanAccent,
                onChanged: (bool value) {
                  setState(() {
                    isActive = value;
                  });
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text('Log out', style: TextStyle(color: Colors.red)),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: 8),
            CustomTextFiled(hittext: 'Enter Task', controller: taskController),
            SizedBox(height: 8),
            CustomButtoms(
              text: 'Add Task',
              color: Colors.deepPurple,
              textcolor: Colors.white,
              onPressed: () {
                setState(() {
                  if (taskController.text.isNotEmpty) {
                    tasks.add({
                      'task': taskController.text,
                      'isChecked': false,
                    });
                    taskController.clear();
                  }
                });
              },
            ),
            SizedBox(height: 16),
            Text(
              'To do Tasks',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 18),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Checkbox(
                          activeColor: Colors.cyanAccent,
                          value: tasks[index]['isChecked'],
                          onChanged: (bool? value) {
                            setState(() {
                              tasks[index]['isChecked'] = value!;
                            });
                          },
                          shape: CircleBorder(),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tasks[index]['task'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: textColor,
                                ),
                              ),
                              Text(
                                tasks[index]['isChecked'] ? "Done" : "Pending",
                                style: TextStyle(color: subTextColor),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              tasks.removeAt(index);
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
