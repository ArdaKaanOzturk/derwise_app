import 'package:derwise_app/theme.dart';
import 'package:derwise_app/util/images_path.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExtraInfo extends StatefulWidget {
  const ExtraInfo({super.key});

  @override
  State<ExtraInfo> createState() => _ExtraInfoState();
}

class _ExtraInfoState extends State<ExtraInfo> {
  final departments = [
    "Architecture",
    "Computer Programming",
    "Dentistry",
    "Electrical-Electronic Engineering",
    "Gastronomy and Kitchen Arts",
    "International Relations",
    "Industrial Design",
    "Nutrition and Dietetics",
    "Physhcology",
    "Software Engineering"
  ];
  String? value;

  List<String> _selectedItems = [];
  void _showMultiSelect() async {
    // a list of selectable items
    // these items can be hard-coded or dynamicly fetched from a database/API
    final List<String> items = [
      "Architectural Design",
      "Introduction to Programming",
      "Dental Anatomy",
      "Circuit Theory",
      "Introduction to International Relations",
      "Design Fundamentals",
      "Human Nutrition",
      "Introduction to Psychology",
      "Software Requirements Engineering",
      "Structural Analysis",
      "Data Structures and Algorithms",
      "Oral Health Sciences",
      "Digital Electronics",
      "Food Safety and Sanitation",
      "Global Governance",
      "Product Design",
      "Clinical Nutrition",
      "Cognitive Psychology",
      "Software Testing and Quality Assurance"
    ];

    final List<String>? results = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return MultiSelect(items: items);
        });

    // Update UI
    if (results != null) {
      setState(() {
        _selectedItems = results;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DerwiseTheme.backgroundApp,
      appBar: AppBar(
        elevation: 0,
        title: Text("Additional Informations", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        centerTitle: true,
        backgroundColor: DerwiseTheme.backgroundApp,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                //choose profile image
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage(ImageConstant.emptyProfileImage),
                    backgroundColor: Colors.black,
                  ),
                ),

                SizedBox(height: 50),

                Column(
                  children: [
                    Text("University:",
                        style: TextStyle(color: DerwiseTheme.lightBlue, fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: 10),
                    Form(
                        child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Type Your University Here",
                          ),
                        )
                      ],
                    ))
                  ],
                ),

                SizedBox(height: 50),

                Column(
                  children: [
                    Text("Department:",
                        style: TextStyle(color: DerwiseTheme.colorBlue, fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: 10),
                    Container(
                      width: 400,
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: value,
                          iconSize: 35,
                          icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                          isExpanded: true,
                          items: departments.map(buildMenuItem).toList(),
                          onChanged: (value) => setState(() {
                            this.value = value;
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                
                Column(
                  children: [
                    Text("Favorite Subjects:",
                        style: TextStyle(color: DerwiseTheme.colorBlue, fontWeight: FontWeight.bold, fontSize: 18)),
                        SizedBox(height: 10),
                    ElevatedButton(onPressed: _showMultiSelect, child: const Text("Select subjects you are good at")
                    ),
                  ],
                ),

                const Divider(
                  height: 30,
                ),
                // display selected items
                Wrap(
                  children: _selectedItems.map((e) => Chip(label: Text(e),
                  ))
                  .toList(),
                ),

                SizedBox(height: 50),

                Column(
                  children: [
                    Text("About:",
                        style: TextStyle(color: DerwiseTheme.lightBlue, fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: 10),
                    Form(
                        child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Type Something About Yourself",
                          ),
                        )
                      ],
                    ))
                  ],
                ),

                SizedBox(height: 100),

              ],
            ),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String departments) => DropdownMenuItem(
        value: departments,
        child: Text(departments, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      );
}

class MultiSelect extends StatefulWidget {
  final List<String> items;
  const MultiSelect({super.key, required this.items});

  @override
  State<MultiSelect> createState() => _MultiSelectState();
}

class _MultiSelectState extends State<MultiSelect> {
  // this variable holds the selected items
  final List<String> _selectedItems = [];

  // This function is triggeered when a chechbox is checked  or unchecked
  void _itemChange(String itemValue, bool isSelected){
    setState(() {
      if(isSelected){
        _selectedItems.add(itemValue);
      }else{
        _selectedItems.remove(itemValue);
      }
    });
  }

  // this function is called when the cancel button is pressed
  void _cancel(){
    Navigator.pop(context);
  }

  // function is called when the submit button is tapped
  void _submit(){
    Navigator.pop(context, _selectedItems);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Select Subjects"),
      content: SingleChildScrollView(
        child: ListBody(
          children: widget.items.map((item) => CheckboxListTile(value: _selectedItems.contains(item),
          title: Text(item),
          controlAffinity: ListTileControlAffinity.leading,
           onChanged: (isChecked)=>_itemChange(item, isChecked!),
           ))
           .toList(),
        ),
      ),
      actions: [
        TextButton(onPressed: _cancel, child: const Text("Cancel")
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const  Text("Submit"),
        ),
      ],
    );
  }
}
