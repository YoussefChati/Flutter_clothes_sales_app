import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/cart/payment_success_page.dart';

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Card Number',
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Expiration Date',
                    ),
                  ),
                ),
                SizedBox(width: 16.0),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'CVV',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Perform payment processing logic here
                // You can add validation and payment processing code

                // Assuming the payment is successful
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentSuccessPage()),
                );
              },
              child: Text('Make Payment'),
            ),
          ],
        ),
      ),
    );
  }
}
