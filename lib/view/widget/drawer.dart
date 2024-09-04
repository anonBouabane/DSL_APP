import 'package:dslsale/util/textstyle.dart';
import 'package:dslsale/view/Screen/auth/login.dart';
import 'package:dslsale/view/Screen/productcart/product_cart.dart';
import 'package:dslsale/view/Screen/printBill/history_invoice.dart';
import 'package:dslsale/view/Screen/profile/profile.dart';
import 'package:dslsale/view/Screen/registerCustomer/register_customer.dart';
import 'package:dslsale/view/widget/listtile_drawer.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          curve: Curves.fastOutSlowIn,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(15)),
            color: Colors.blue,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('Anon BOUABANE', style: textTitlewhite),
            ],
          ),
        ),
        ListTileDrawer(
            textTile: "ເບິ່ງໂປຣໄຟລ໌",
            style: textSimplegrey,
            icon: Icons.person_outline_outlined,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileScreen(),
                ),
              );
            }),
        ListTileDrawer(
          textTile: "ລົງທະບຽນລູກຄ້າ",
          style: textSimplegrey,
          icon: Icons.group_add_outlined,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const RegisterCustoScreen()));
          },
        ),
        ListTileDrawer(
          textTile: "ປິ້ນບິນ",
          style: textSimplegrey,
          icon: Icons.print,
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(  
                    builder: (context) => const HistoryInvoice()));
          },
        ),
        ListTileDrawer(
          textTile: "ກະຕ່າສິນຄ້າ",
          style: textSimplegrey,
          icon: Icons.shopping_cart_outlined,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CartScreen()));
          },
        ),
        const Divider(),
        ListTileDrawer(
          textTile: "ອອກຈາກລະບົບ",
          style: textSimplegrey,
          icon: Icons.exit_to_app,
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => const LoginScreen()));
          },
        ),
      ],
    ));
  }
}
