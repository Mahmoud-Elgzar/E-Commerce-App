// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:final_e_commerce/services/store.dart';
import 'package:final_e_commerce/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:final_e_commerce/models/product.dart';

// ignore: must_be_immutable, use_key_in_widget_constructors
class AddProduct extends StatelessWidget {
  static const String id = "AddProduct";
  late String _name, _price, _description, _category, _imageLocation;
  final _formKey = GlobalKey<FormState>();
  final Store _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
              hint: 'product Name',
              errorText: 'Enter Product Name',
              onClick: (value) {
                _name = value!;
              },
              icon: Icons.drive_file_rename_outline,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                hint: 'product Price',
                icon: Icons.monetization_on,
                errorText: 'Enter Product Price',
                onClick: (value) {
                  _price = value!;
                }),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                hint: 'product Description',
                icon: Icons.description,
                errorText: 'Enter Product Description',
                onClick: (value) {
                  _description = value!;
                }),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                hint: 'product Category',
                icon: Icons.category,
                errorText: 'Enter Product Category',
                onClick: (value) {
                  _category = value!;
                }),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
                hint: 'product Location',
                icon: Icons.location_on,
                errorText: 'Enter Product Location',
                onClick: (value) {
                  _imageLocation = value!;
                }),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    _store.addProduct(Product(
                        pName: _name,
                        pPrice: _price,
                        pDescription: _description,
                        pCategory: _category,
                        pLocation: _imageLocation));
                    Navigator.pop(context);
                  }
                },
                child: const Text('Add Product')),
          ],
        ),
      ),
    );
  }
}
