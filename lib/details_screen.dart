import 'package:ecom_app/models/product.dart';
import 'package:ecom_app/providers/cart_provider.dart';
import 'package:ecom_app/home_screen.dart';
import 'package:ecom_app/services/user_service.dart'; // import UserService
import 'package:ecom_app/widgets/available_size.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.product});
  final Product product;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final UserService _userService =
      UserService(); // create an instance of UserService
  final _razorpay = Razorpay();
 void _onSubmit(Product product) async {
    print("Submit button pressed");
      var options = {
        'key': '',
        'amount': product.price.toInt() * 100,
        'name': 'Your Shop',
        'currency': 'INR',
        'description': 'Purchase: ${product.name}',
        'prefill': {'contact': '7827733004', 'email': 'test@example.com'},
      };

      try {
         _razorpay.open(options);
        
      } catch (e) {
        print("Error: $e");
      }
    }


  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Payment successful!')),
    );

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => HomeScreen(index: 0)),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Payment failed: ${response.message}')),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('External wallet selected: ${response.walletName}')),
    );
  }
  
  @override
  void initState() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    super.initState();
  }
  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final provider = CartProvider.of(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0), // custom height
        child: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(color: Colors.blue),
          ),
          title: const Text(
            'Details',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          automaticallyImplyLeading: true,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            const SizedBox(
              height: 35,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 160,
                  height: 160,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  child: Image.asset(
                    widget.product.image,
                    scale: 3.3,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 14,
            ),
            Container(
              decoration: const BoxDecoration(),
              child: Column(
                children: [
                  Text(
                    widget.product.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "₹ ${widget.product.price}",
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    widget.product.description,
                    textAlign: TextAlign.justify,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Available Options',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      if (int.parse(widget.product.id) >= 1 &&
                          int.parse(widget.product.id) <= 25) ...[
                        const AvailableSize(
                          size: "US 6",
                        ),
                        const AvailableSize(
                          size: "US 7",
                        ),
                        const AvailableSize(
                          size: "US 8",
                        ),
                        const AvailableSize(
                          size: "US 9",
                        ),
                      ],
                      if (int.parse(widget.product.id) >= 26 &&
                          int.parse(widget.product.id) <= 50) ...[
                        const AvailableSize(
                          size: "M",
                        ),
                        const AvailableSize(
                          size: "L",
                        ),
                        const AvailableSize(
                          size: "XL",
                        ),
                        const AvailableSize(
                          size: "XXL",
                        ),
                      ],
                      if (int.parse(widget.product.id) >= 51 &&
                          int.parse(widget.product.id) <= 75) ...[
                        const AvailableSize(
                          size: "128GB",
                        ),
                        const AvailableSize(
                          size: "256GB",
                        ),
                        const AvailableSize(
                          size: "512GB",
                        ),
                        const AvailableSize(
                          size: "1TB",
                        ),
                      ],
                      if (int.parse(widget.product.id) >= 76 &&
                          int.parse(widget.product.id) <= 100) ...[
                        const AvailableSize(
                          size: "128GB",
                        ),
                        const AvailableSize(
                          size: "256GB",
                        ),
                        const AvailableSize(
                          size: "512GB",
                        ),
                      ],
                      if (int.parse(widget.product.id) >= 101 &&
                          int.parse(widget.product.id) <= 125) ...[
                        const AvailableSize(
                          size: "M",
                        ),
                        const AvailableSize(
                          size: "L",
                        ),
                        const AvailableSize(
                          size: "XL",
                        ),
                        const AvailableSize(
                          size: "XXL",
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Available Colors',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "₹ ${widget.product.price}",
                      style: const TextStyle(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 10,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      _onSubmit(widget.product);
                    },
                    label: const Text(
                      "Buy now",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      await _userService.addToCart(
                          widget.product); // call the addToCart function
                      provider.toggleProduct(widget.product);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(index: 2),
                        ),
                      );
                    },
                    label: const Text(
                      "Add to Cart",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
