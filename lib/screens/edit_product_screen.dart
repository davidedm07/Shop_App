import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/product.dart';
import 'package:form_field_validator/form_field_validator.dart';

class EditProductScreen extends StatefulWidget {
  static const route = 'edit-product-screen';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _formKey = GlobalKey<FormState>();
  var _editedProduct = Product(
    id: null,
    price: 0,
    title: '',
    description: '',
    imageUrl: '',
  );

  String _validateText(String text) {
    if (text.isEmpty) {
      return 'Please provide a value!';
    }
    return null;
  }

  String _validateNumber(String value) {
    var parsedValue = double.parse(value);
    if (parsedValue == null) {
      return 'Please provide a number';
    } else if (parsedValue <= 0) {
      return 'Please provide a valid price!';
    }
    return null;
  }

  void _saveForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: [
          IconButton(icon: Icon(Icons.save), onPressed: _saveForm),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Title'),
                  textInputAction: TextInputAction.next,
                  validator: _validateText,
                  onSaved: (value) {
                    return Product(
                      id: null,
                      title: value,
                      description: _editedProduct.description,
                      price: _editedProduct.price,
                      imageUrl: _editedProduct.imageUrl,
                    );
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Price'),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  validator: _validateNumber,
                  onSaved: (value) {
                    return Product(
                      id: null,
                      title: _editedProduct.title,
                      description: _editedProduct.description,
                      price: double.parse(value),
                      imageUrl: _editedProduct.imageUrl,
                    );
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Description'),
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  validator: _validateText,
                  onSaved: (value) {
                    return Product(
                      id: null,
                      title: _editedProduct.title,
                      description: value,
                      price: _editedProduct.price,
                      imageUrl: _editedProduct.imageUrl,
                    );
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Image Url'),
                  keyboardType: TextInputType.url,
                  onFieldSubmitted: (_) => _saveForm(),
                  validator: PatternValidator(
                    r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?",
                    errorText: 'Please provide a value Url',
                  ),
                  onSaved: (value) {
                    return Product(
                      id: null,
                      title: _editedProduct.title,
                      description: _editedProduct.description,
                      price: _editedProduct.price,
                      imageUrl: value,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
