import 'package:flutter/material.dart';
import 'package:trainning/screen/custom_paint/ticket_custom_paint/body_ticket_custom_painter.dart';
import 'package:trainning/screen/custom_paint/ticket_custom_paint/footer_ticket_custom_painter.dart';
import 'package:trainning/screen/custom_paint/ticket_custom_paint/header_ticket_custom_painter.dart';

const double ticketWidth = 300;
const double height = 100;

class TicketCustomPaint extends StatelessWidget {
  const TicketCustomPaint({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ticket Custom Painter"),
      ),
      backgroundColor: Colors.grey,
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [Text('awd')],
            ),
            HeaderTicketCustomPainter(),
            BodyTicketCustomPainter(),
            FooterTicketCustomPainter(),
          ],
        ),
      ),
    );
  }
}
