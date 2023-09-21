import 'package:flutter/material.dart';

class DatePickerExample2 extends StatefulWidget {
  @override
  _DatePickerExampleState2 createState() => _DatePickerExampleState2();
}

class _DatePickerExampleState2 extends State<DatePickerExample2> {
  DateTime? _selectedDate;
  final TextEditingController _dateController = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate:
          _selectedDate ?? DateTime(2022, 01, 01), // Ajuste a data inicial aqui
      firstDate: DateTime(2021, 01, 01), // Data inicial válida
      lastDate: DateTime(2022, 12, 31), // Data final válida
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.green,
            hintColor: Colors.greenAccent,
            buttonTheme: ButtonThemeData(
              textTheme: ButtonTextTheme.primary,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dateController.text =
            '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _dateController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: 'Até',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.0),
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.0),
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.calendar_month),
          onPressed: () {
            _selectDate(context);
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }
}
