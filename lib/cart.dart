import 'package:flutter/material.dart';
import '../data/cart_data.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  String selectedDelivery = "shop";

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: cart,
      builder: (context, child) {
        double subtotal = 0;
        for (var item in cart.items) {
          subtotal += item.product.price * item.quantity;
        }

        double delivery;
        if (selectedDelivery == "shop") {
          delivery = 0;
        } else {
          delivery = 2100;
        }
        double total = subtotal + delivery;

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // =========================
                // ORDER SUMMARY CARD
                // =========================
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFFE2E8F0),
                      width: 1.5,
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          "Order Summary",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),

                      // Cart Items List
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cart.items.length,
                        itemBuilder: (context, index) {
                          final item = cart.items[index];
                          return Padding(
                            padding: const EdgeInsets.all(12),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    item.product.image,
                                    height: 70,
                                    width: 70,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item.product.name,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 8),
                                      Row(
                                        children: [
                                          _qtyButton(
                                            icon: Icons.remove,
                                            onTap: () =>
                                                cart.decrementQuantity(item),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              "${item.quantity}",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          _qtyButton(
                                            icon: Icons.add,
                                            onTap: () =>
                                                cart.incrementQuantity(item),
                                          ),
                                          const Spacer(),
                                          IconButton(
                                            onPressed: () =>
                                                cart.removeItem(item),
                                            icon: const Icon(
                                              Icons.delete_outline,
                                              color: Colors.redAccent,
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "MK ${(item.product.price * item.quantity).toStringAsFixed(0)}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),

                      const Divider(),

                      // Price Breakdown
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            _priceRow("Subtotal", subtotal),
                            const SizedBox(height: 8),
                            _priceRow("Delivery", delivery),
                            const Divider(height: 20),
                            _priceRow("Total", total, isTotal: true),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // =========================
                // DELIVERY MODE
                // =========================
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFFE2E8F0),
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Delivery Mode",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      _deliveryOption(
                        title: "Take at Shop",
                        subtitle: "Collect your order from our shop",
                        value: "shop",
                        price: "FREE",
                        icon: Icons.store,
                      ),
                      const Divider(),
                      _deliveryOption(
                        title: "Courier Delivery",
                        subtitle: "Have your order delivered to you",
                        value: "courier",
                        price: "MK 2,100",
                        icon: Icons.delivery_dining,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // =========================
                // PAYMENT MODE
                // =========================
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFFE2E8F0),
                      width: 1.5,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Mode of Payment",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      _paymentOption("Airtel Money", "assets/images/airtel2.jpg"),
                      const SizedBox(height: 10),
                      _paymentOption("TNM Mpamba", "assets/images/tnm.jpg"),
                      const SizedBox(height: 10),
                      _paymentOption("National Bank", "assets/images/nb.png"),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        );
      },
    );
  }

  // =====================================================
  // HELPER WIDGETS
  // =====================================================

  Widget _qtyButton({required IconData icon, required VoidCallback onTap}) {
    return Material(
      color: Colors.grey.shade100,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.all(4),
          child: Icon(icon, size: 18, color: const Color(0xFF0F172A)),
        ),
      ),
    );
  }

  Widget _priceRow(String label, double amount, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 18 : 15,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? Colors.black : Colors.grey.shade700,
          ),
        ),
        Text(
          "MK ${amount.toStringAsFixed(isTotal ? 2 : 0)}",
          style: TextStyle(
            fontSize: isTotal ? 18 : 15,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? const Color(0xFF10B981) : Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _deliveryOption({
    required String title,
    required String subtitle,
    required String value,
    required String price,
    required IconData icon,
  }) {
    return InkWell(
      onTap: () => setState(() => selectedDelivery = value),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Radio<String>(
              value: value,
              activeColor: const Color(0xFF10B981),
              groupValue: selectedDelivery,
              onChanged: (v) => setState(() => selectedDelivery = v!),
            ),
            Icon(icon, size: 24, color: const Color(0xFF0F172A)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(subtitle,
                      style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ),
            Text(price, style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _paymentOption(String name, String assetPath) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(assetPath, height: 40, width: 40, fit: BoxFit.cover),
          ),
          const SizedBox(width: 15),
          Text(
            name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
        ],
      ),
    );
  }
}

int total = cart.items.length;