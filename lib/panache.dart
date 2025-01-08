import 'package:flutter/material.dart';

class Panache extends StatelessWidget {
  const Panache({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Row(children: [
          SizedBox(
            width: 200,
            child: Column(children: [
              TextFormField(keyboardType: TextInputType.number),
              FilledButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text('Paragraphs'),
              ),
              FilledButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text('Words'),
              ),
              FilledButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text('Bytes'),
              ),
              FilledButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Text('Lists'),
              ),
            ]),
          ),
          Expanded(
            child: Column(children: [Text('Lorem Ipsum Dummy Text')]),
          )
        ])
      ]),
    );
  }
}
