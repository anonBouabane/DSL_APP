class Invoice {
  String customerName;
  String invoiceNumber;
  List<InvoiceItem> items;

  Invoice({required this.customerName, required this.invoiceNumber, required this.items});

  void printInvoice() {
    print('Invoice Number: $invoiceNumber');
    print('Customer Name: $customerName');
    print('Items:');
    for (var item in items) {
      print('${item.name}: ${item.quantity} x ${item.price}');
    }
    print('Total: ${calculateTotal()}');
  }

  double calculateTotal() {
    double total = 0;
    for (var item in items) {
      total += item.quantity * item.price;
    }
    return total;
  }
}

class InvoiceItem {
  String name;
  int quantity;
  double price;

  InvoiceItem({required this.name, required this.quantity, required this.price});
}