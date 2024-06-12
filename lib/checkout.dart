import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  // State variables for managing selected items
  bool _isFirstItemSelected = false;
  bool _isSecondItemSelected = false;
  bool _isChooseAllSelected = false;

  // State variables for managing the visibility of details
  bool _isFirstDetailVisible = false;
  bool _isSecondDetailVisible = false;

  void _toggleChooseAll(bool? value) {
    setState(() {
      _isChooseAllSelected = value!;
      _isFirstItemSelected = value;
      _isSecondItemSelected = value;
    });
  }

  void _updateChooseAllState() {
    setState(() {
      _isChooseAllSelected = _isFirstItemSelected && _isSecondItemSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the total payment based on selected items
    int totalPayment = 0;
    if (_isFirstItemSelected) totalPayment += 450000;
    if (_isSecondItemSelected) totalPayment += 240000;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Internet",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Define the back button action here
          },
        ),
        backgroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.yellow[100],
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: Colors.yellow[700]!,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.info, color: Colors.yellow[700]),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: Text(
                      'Perlu diketahui, proses verifikasi transaksi dapat memakan waktu hingga 1x24 jam.',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            // Choose All checkbox
            CheckboxListTile(
              value: _isChooseAllSelected,
              onChanged: _toggleChooseAll,
              title: Text('Choose All'),
            ),
            Divider(),
            // List of payment items with details
            _buildPaymentItem(
              value: _isFirstItemSelected,
              onChanged: (bool? value) {
                setState(() {
                  _isFirstItemSelected = value!;
                  _updateChooseAllState();
                });
              },
              amount: 'Rp450.000',
              dueDate: 'Due date on 16 Feb 2024',
              logoPath: 'images/nethome.png',
              providerName: 'nethome ',
              customerId: '123456',
              servicePackage: 'Paket Internet 100Mbps',
              isDetailVisible: _isFirstDetailVisible,
              onToggleDetail: () {
                setState(() {
                  _isFirstDetailVisible = !_isFirstDetailVisible;
                });
              },
            ),
            Divider(),
            _buildPaymentItem(
              value: _isSecondItemSelected,
              onChanged: (bool? value) {
                setState(() {
                  _isSecondItemSelected = value!;
                  _updateChooseAllState();
                });
              },
              amount: 'Rp240.000',
              dueDate: 'Due date on 20 Feb 2024',
              logoPath: 'images/bisnet.png',
              providerName: 'bisnet',
              customerId: '654321',
              servicePackage: 'Paket Internet 50Mbps',
              isDetailVisible: _isSecondDetailVisible,
              onToggleDetail: () {
                setState(() {
                  _isSecondDetailVisible = !_isSecondDetailVisible;
                });
              },
            ),
            Divider(),
            // Total Payment section
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Payment'),
                Text('Rp$totalPayment'),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Define the pay now button action here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize:
                    Size(double.infinity, 50), // Make button full width
              ),
              child: Text(
                'PAY NOW',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentItem({
    required bool value,
    required ValueChanged<bool?> onChanged,
    required String amount,
    required String dueDate,
    required String logoPath,
    required String providerName,
    required String customerId,
    required String servicePackage,
    required bool isDetailVisible,
    required VoidCallback onToggleDetail,
  }) {
    return Column(
      children: [
        CheckboxListTile(
          value: value,
          onChanged: onChanged,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(amount),
              Text(dueDate),
            ],
          ),
          secondary: Image.asset(
            logoPath, // replace with your asset path
            width: 30,
            height: 30,
          ),
        ),
        GestureDetector(
          onTap: onToggleDetail,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(
              'See Details',
              style: TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
        if (isDetailVisible)
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Provider',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(providerName),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ID Pelanggan',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(customerId),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Paket Layanan',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(servicePackage),
                  ],
                ),
                SizedBox(height: 8.0),
              ],
            ),
          ),
      ],
    );
  }
}
