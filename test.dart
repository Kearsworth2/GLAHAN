import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Editable Cards'),
        ),
        body: EditableCardList(),
      ),
    );
  }
}

class EditableCardList extends StatefulWidget {
  @override
  _EditableCardListState createState() => _EditableCardListState();
}

class _EditableCardListState extends State<EditableCardList> {
  List<CardData> cardDataList = [
    CardData(name: 'John', number: '123456'),
    CardData(name: 'Jane', number: '789012'),
    // Add more card data as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cardDataList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            _editNumber(index);
          },
          child: Card(
            child: ListTile(
              title: Text(cardDataList[index].name),
              subtitle: Text(cardDataList[index].number),
            ),
          ),
        );
      },
    );
  }

  void _editNumber(int index) {
    // Display a dialog or navigate to a new screen to edit the number
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Number'),
          content: TextField(
            controller: TextEditingController(text: cardDataList[index].number),
            onChanged: (newNumber) {
              setState(() {
                cardDataList[index].number = newNumber;
              });
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Save the edited number
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

class CardData {
  final String name;
  String number;

  CardData({required this.name, required this.number});
}
