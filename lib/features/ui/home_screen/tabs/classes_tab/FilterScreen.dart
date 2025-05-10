import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String? _selectedClassType;
  DateTime? _selectedDate;
  TimeOfDay? _selectedStartTime;
  TimeOfDay? _selectedEndTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Classes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // فلتر نوع الكلاس
            const Text('Class Type',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Row(
              children: [
                _buildFilterButton('All', _selectedClassType, () {
                  setState(() {
                    _selectedClassType = 'All';
                  });
                }),
                const SizedBox(width: 8),
                _buildFilterButton('Zomba', _selectedClassType, () {
                  setState(() {
                    _selectedClassType = 'Zomba';
                  });
                }),
                const SizedBox(width: 8),
                _buildFilterButton('Cycling', _selectedClassType, () {
                  setState(() {
                    _selectedClassType = 'Cycling';
                  });
                }),
                // ممكن نضيف باقي الأنواع هنا
              ],
            ),
            const SizedBox(height: 20),

            // فلتر التاريخ
            const Text('Date',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            InkWell(
              onTap: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate ?? DateTime.now(),
                  firstDate: DateTime(2023),
                  lastDate: DateTime(2026),
                );
                if (pickedDate != null) {
                  setState(() {
                    _selectedDate = pickedDate;
                  });
                }
              },
              child: InputDecorator(
                decoration: const InputDecoration(
                  labelText: 'Select Date',
                  border: OutlineInputBorder(),
                ),
                child: Text(_selectedDate == null
                    ? 'Not selected'
                    : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'),
              ),
            ),
            const SizedBox(height: 20),

            // فلتر الوقت
            const Text('Time',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final pickedTime = await showTimePicker(
                        context: context,
                        initialTime: _selectedStartTime ??
                            const TimeOfDay(hour: 0, minute: 0),
                      );
                      if (pickedTime != null) {
                        setState(() {
                          _selectedStartTime = pickedTime;
                        });
                      }
                    },
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'From',
                        border: OutlineInputBorder(),
                      ),
                      child: Text(_selectedStartTime == null
                          ? 'Not selected'
                          : _selectedStartTime!.format(context)),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                const Text('to'),
                const SizedBox(width: 16),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final pickedTime = await showTimePicker(
                        context: context,
                        initialTime: _selectedEndTime ??
                            const TimeOfDay(hour: 23, minute: 59),
                      );
                      if (pickedTime != null) {
                        setState(() {
                          _selectedEndTime = pickedTime;
                        });
                      }
                    },
                    child: InputDecorator(
                      decoration: const InputDecoration(
                        labelText: 'To',
                        border: OutlineInputBorder(),
                      ),
                      child: Text(_selectedEndTime == null
                          ? 'Not selected'
                          : _selectedEndTime!.format(context)),
                    ),
                  ),
                ),
              ],
            ),

            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, {
                    'type': _selectedClassType,
                    'date': _selectedDate == null
                        ? null
                        : '${_selectedDate!.year}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.day.toString().padLeft(2, '0')}',
                    'startTime': _selectedStartTime?.format(context),
                    'endTime': _selectedEndTime?.format(context),
                  });
                },
                child: const Text('Apply'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(
      String text, String? selectedValue, VoidCallback onPressed) {
    final isSelected = text == selectedValue;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.grey[300],
        foregroundColor: isSelected ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(text),
    );
  }
}
