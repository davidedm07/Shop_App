import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/providers/product.dart';
import 'package:flutter_complete_guide/providers/products.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

class EditProductScreen extends StatefulWidget {
  static const route = 'edit-product-screen';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  var _isInit = true;
  final _formKey = GlobalKey<FormState>();
  var _initProduct = Product(
    id: null,
    price: 0,
    title: '',
    description: '',
    imageUrl: '',
  );

  var _editedProduct;

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
    final productProvider = Provider.of<Products>(context, listen: false);
    if(_editedProduct.id != null) {
      productProvider.updateProduct(_editedProduct);
    }
    else {
      productProvider.addProduct(_editedProduct);
    }
    Navigator.of(context).pop();
  }

  @override
  void didChangeDependencies() {
    var productById;
    if (_isInit) {
      final productId = ModalRoute.of(context).settings.arguments as String;
      if(productId != null) {
        productById =
            Provider.of<Products>(context, listen: false).findById(productId);
      }
      _editedProduct = productById == null ? _initProduct : productById;
    }
    super.didChangeDependencies();
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
                  initialValue: _editedProduct.title,
                  textInputAction: TextInputAction.next,
                  validator: _validateText,
                  onSaved: (value) {
                    _editedProduct =  Product(
                      id: _editedProduct.id,
                      title: value,
                      description: _editedProduct.description,
                      price: _editedProduct.price,
                      imageUrl: _editedProduct.imageUrl,
                    );
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Price'),
                  initialValue: _editedProduct.price.toString(),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  validator: _validateNumber,
                  onSaved: (value) {
                    _editedProduct =  Product(
                      id: _editedProduct.id,
                      title: _editedProduct.title,
                      description: _editedProduct.description,
                      price: double.parse(value),
                      imageUrl: _editedProduct.imageUrl,
                    );
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Description'),
                  initialValue: _editedProduct.description,
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  validator: _validateText,
                  onSaved: (value) {
                    _editedProduct = Product(
                      id: _editedProduct.id,
                      title: _editedProduct.title,
                      description: value,
                      price: _editedProduct.price,
                      imageUrl: _editedProduct.imageUrl,
                    );
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Image Url'),
                  initialValue: _editedProduct.imageUrl,
                  keyboardType: TextInputType.url,
                  onFieldSubmitted: (_) => _saveForm(),
                  validator: PatternValidator(
                    r"(https?|http)?",
                    errorText: 'Please provide a value Url',
                  ),
                  onSaved: (value) {
                    _editedProduct =  Product(
                      id: _editedProduct.id,
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
