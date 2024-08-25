import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Course extends StatelessWidget {
  const Course({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('معلومات الدورة'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Table(
                border: TableBorder.all(color: Colors.black, width: 2),
                defaultColumnWidth: const IntrinsicColumnWidth(),
                children: [
                  _buildHeaderRow(),
                  _buildDataRow([
                    'الدورة 1',
                    'المدرب أ',
                    'المتدرب 1',
                    '2024-06-05',
                    '2024-06-10',
                    '\$1000',
                    '20',
                    '5',
                    '001',
                    'الفرع 1',
                    'موظف'
                  ]),
                  _buildDataRow([
                    'الدورة 2',
                    'المدرب ب',
                    'المتدرب 2',
                    '2024-07-05',
                    '2024-07-10',
                    '\$1500',
                    '25',
                    '3',
                    '002',
                    'الفرع 2',
                    'خارجي'
                  ]),
                  _buildDataRow([
                    'الدورة 3',
                    'المدرب ج',
                    'المتدرب 3',
                    '2024-08-05',
                    '2024-08-10',
                    '\$2000',
                    '30',
                    '2',
                    '003',
                    'الفرع 3',
                    'موظف'
                  ]),
                  _buildDataRow([
                    'الدورة 4',
                    'المدرب د',
                    'المتدرب 4',
                    '2024-09-05',
                    '2024-09-10',
                    '\$1200',
                    '18',
                    '4',
                    '004',
                    'الفرع 4',
                    'خارجي'
                  ]),
                  _buildDataRow([
                    'الدورة 5',
                    'المدرب هـ',
                    'المتدرب 5',
                    '2024-10-05',
                    '2024-10-10',
                    '\$900',
                    '22',
                    '6',
                    '005',
                    'الفرع 5',
                    'موظف'
                  ]),
                  _buildDataRow([
                    'الدورة 6',
                    'المدرب و',
                    'المتدرب 6',
                    '2024-11-05',
                    '2024-11-10',
                    '\$1100',
                    '24',
                    '1',
                    '006',
                    'الفرع 6',
                    'خارجي'
                  ]),
                  _buildDataRow([
                    'الدورة 7',
                    'المدرب ز',
                    'المتدرب 7',
                    '2024-12-05',
                    '2024-12-10',
                    '\$1300',
                    '19',
                    '5',
                    '007',
                    'الفرع 7',
                    'موظف'
                  ]),
                  _buildDataRow([
                    'الدورة 8',
                    'المدرب ح',
                    'المتدرب 8',
                    '2025-01-05',
                    '2025-01-10',
                    '\$1600',
                    '26',
                    '2',
                    '008',
                    'الفرع 8',
                    'خارجي'
                  ]),
                  _buildDataRow([
                    'الدورة 9',
                    'المدرب ط',
                    'المتدرب 9',
                    '2025-02-05',
                    '2025-02-10',
                    '\$1400',
                    '28',
                    '3',
                    '009',
                    'الفرع 9',
                    'موظف'
                  ]),
                  _buildDataRow([
                    'الدورة 10',
                    'المدرب ي',
                    'المتدرب 10',
                    '2025-03-05',
                    '2025-03-10',
                    '\$1700',
                    '27',
                    '4',
                    '010',
                    'الفرع 10',
                    'خارجي'
                  ]),
                ],
              ),
            ),
            // Spacer(),
            SizedBox(
              width: 50,
            ),
            Column(
              children: [
                Text("500",
                    style: TextStyle(fontSize: 25, color: Colors.black)),
                SizedBox(
                  height: 15,
                ),
                Text("10", style: TextStyle(fontSize: 25, color: Colors.black)),
                SizedBox(
                  height: 15,
                ),
                Text("450",
                    style: TextStyle(fontSize: 25, color: Colors.green)),
                SizedBox(
                  height: 15,
                ),
                Text("50", style: TextStyle(fontSize: 25, color: Colors.red)),
                SizedBox(
                  height: 15,
                ),
                Text("15", style: TextStyle(fontSize: 25, color: Colors.black)),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(": اجمالي عدد المتدربين",
                    style: TextStyle(fontSize: 25, color: Colors.blue)),
                SizedBox(
                  height: 15,
                ),
                Text(": اجمالي عدد المدربين",
                    style: TextStyle(fontSize: 25, color: Colors.blue)),
                SizedBox(
                  height: 15,
                ),
                Text(": اجمالي عدد الناجحين",
                    style: TextStyle(fontSize: 25, color: Colors.blue)),
                SizedBox(
                  height: 15,
                ),
                Text(": اجمالي عدد الراسبين",
                    style: TextStyle(fontSize: 25, color: Colors.blue)),
                SizedBox(
                  height: 15,
                ),
                Text(": اجمالي مرات الدورة ",
                    style: TextStyle(fontSize: 25, color: Colors.blue))
              ],
            )
          ],
        ),
      ),
    );
  }

  TableRow _buildHeaderRow() {
    return TableRow(
      children: [
        _buildCell('الدورة', isHeader: true),
        _buildCell('المدرب', isHeader: true),
        _buildCell('اسم المتدرب', isHeader: true),
        _buildCell('تاريخ بدء الدورة', isHeader: true),
        _buildCell('تاريخ انتهاء الدورة', isHeader: true),
        _buildCell('التكلفة', isHeader: true),
        _buildCell('عدد الناجحين', isHeader: true),
        _buildCell('عدد الراسبين', isHeader: true),
        _buildCell('الكود', isHeader: true),
        _buildCell('الفرع', isHeader: true),
        _buildCell('موظف/خارجي', isHeader: true),
      ],
    );
  }

  TableRow _buildDataRow(List<String> cells) {
    return TableRow(
      children: cells.map((cell) => _buildCell(cell)).toList(),
    );
  }

  Widget _buildCell(String text, {bool isHeader = false}) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.0),
        color: isHeader ? Colors.blue : Colors.white,
      ),
      child: Text(
        text,
        style: TextStyle(
            color: isHeader ? Colors.white : Colors.black,
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal),
        textAlign: TextAlign.center,
      ),
    );
  }
}
