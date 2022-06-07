// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:startup_try_2/models/Product.dart';
//
// class EditProductScreen extends StatefulWidget {
//   @override
//   _EditProductScreenState createState() => _EditProductScreenState();
// }
//
// class _EditProductScreenState extends State<EditProductScreen> {
//   final _form = GlobalKey<FormState>();
//   DateTime _selectedDate;
//   var _isInit = true;
//   var _isLoading = false;
//   var _isColour = true;
//   var _colors = ['White', 'Black', 'Red', 'Blue'];
//   var _currentColour = null;
//   var _number = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
//   var _currentNumber = null;
//
//   var _editedProduct = Product(
//     description: '',
//     id: null,
//     image: '',
//     price: 0,
//     title: '',
//     color: Colors.white,
//     // discount: 0,
//   );
//
//   var _initValues = {
//     'title': '',
//     'price': '',
//     'description': '',
//     'image': '',
//     'discount': '',
//     'color': '',
//   };
//
//   final _priceNode = FocusNode();
//   final _desNode = FocusNode();
//   final _discNode = FocusNode();
//   final _imageUrlNode = FocusNode();
//   final _imageUrlController = TextEditingController();
//   //I need it here because i want to have this value before submitting the form if i want value after submitting then i dont do this.
//   //We cant have the intial values and controller both at asame time.
//
//   @override
//   void initState() {
//     // ignore: todo
//     // TODO: implement initState
//     _imageUrlNode.addListener(_updateUrl);
//
//     super.initState();
//   }
//
//   @override
//   void didChangeDependencies() {
//     if (_isInit) {
//       final productId = ModalRoute.of(context).settings.arguments as String;
//       if (productId != null) {
//         // _editedProduct =
//         //     Provider.of<Products>(context, listen: false).findById(productId);
//         _initValues = {
//           'title': _editedProduct.title,
//           'price': _editedProduct.price.toString(),
//           'description': _editedProduct.description,
//           'imageUrl': _editedProduct.image,
//           // 'discount': _editedProduct.discount.toString(),
//           'color': _editedProduct.color.toString(),
//         };
//         _imageUrlController.text = _editedProduct.image;
//       }
//     }
//     _isInit = false;
//
//     super.didChangeDependencies();
//   }
//
//   @override
//   void dispose() {
//     // ignore: todo
//     // TODO: implement dispose
//     _imageUrlNode.removeListener(_updateUrl);
//     _priceNode.dispose();
//     _discNode.dispose();
//     _desNode.dispose();
//     _imageUrlController.dispose();
//     super.dispose();
//   }
//
//   void _presentDatePicker() {
//     showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2020),
//       lastDate: DateTime.now(),
//     ).then((pickedDate) {
//       if (pickedDate == null) {
//         return;
//       } else {
//         setState(() {
//           _selectedDate = pickedDate;
//         });
//       }
//     });
//   }
//
//   Future<void> _saveForm() async {
//     // final isValid = _form.currentState.validate();
//
//     // if (!isValid) {
//     //   return;
//     // }
//     // _form.currentState.save();
//     // setState(() {
//     //   _isLoading = true;
//     // });
//     // if (_editedProduct.id != null) {
//     //   await Provider.of<Products>(context, listen: false).updateProduct(
//     //     _editedProduct.id,
//     //     _editedProduct,
//     //   );
//     // } else {
//     //   try {
//     //     await Provider.of<Products>(
//     //       context,
//     //       listen: false,
//     //     ).addProduct(_editedProduct);
//     //   } catch (error) {
//     //     await showDialog<Null>(
//     //       context: context,
//     //       builder: (ctx) => AlertDialog(
//     //         title: Text('An error occured'),
//     //         content: Text('Something went wrong.'),
//     //         actions: <Widget>[
//     //           FlatButton(
//     //             onPressed: () {
//     //               Navigator.of(context).pop();
//     //             },
//     //             child: Text('Okay'),
//     //           )
//     //         ],
//     //       ),
//     //     );
//     //   }
//
//     //   setState(() {
//     //     _isLoading = false;
//     //   });
//     //   Navigator.of(context).pop();
//     // }
//   }
//
//   void _updateUrl() {
//     // if (!_imageUrlNode.hasFocus) {
//     //   if ((!_imageUrlController.text.startsWith('http') &&
//     //           !_imageUrlController.text.startsWith('https')) ||
//     //       (!_imageUrlController.text.endsWith('.png') &&
//     //           !_imageUrlController.text.endsWith('.jpg') &&
//     //           !_imageUrlController.text.endsWith('.jpeg'))) {
//     //     return;
//     //   }
//     //   setState(() {});
//     // }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Products'),
//         backgroundColor: Colors.blue.shade900,
//         actions: <Widget>[
//           IconButton(
//             onPressed: () => _saveForm(),
//             icon: Icon(Icons.check),
//           ),
//         ],
//       ),
//       body: _isLoading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : Container(
//               color: Colors.blue.shade50,
//               child: Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Form(
//                   key: _form,
//                   child: ListView(
//                     children: <Widget>[
//                       TextFormField(
//                         decoration: InputDecoration(
//                           labelText: 'Title',
//                         ), //U can change here that how your error message should look like.
//                         //textInputAction affects the bottom right cornor button in keyboard.
//                         textInputAction: TextInputAction.next,
//                         initialValue: _initValues['title'],
//                         onFieldSubmitted: (_) {
//                           FocusScope.of(context).requestFocus(_priceNode);
//                         },
//                         validator: (value) {
//                           if (value.isEmpty) {
//                             return 'Please enter a Title';
//                           }
//                           return null; //returning null means you have no error.
//                         },
//                         onSaved: (val) {
//                           _editedProduct = Product(
//                             description: _editedProduct.description,
//                             id: _editedProduct.id,
//                             image: _editedProduct.image,
//                             price: _editedProduct.price,
//                             title: val,
//                             //isFavourite: _editedProduct.isFavourite,
//                           );
//                         },
//                       ),
//                       TextFormField(
//                         decoration: InputDecoration(
//                           labelText: 'Price',
//                         ),
//                         initialValue: _initValues['price'],
//                         keyboardType: TextInputType.number,
//                         textInputAction: TextInputAction.next,
//                         focusNode: _priceNode,
//                         onFieldSubmitted: (_) {
//                           FocusScope.of(context).requestFocus(_desNode);
//                         },
//                         validator: (value) {
//                           if (value.isEmpty) {
//                             return 'Please enter a Number';
//                           }
//                           if (double.tryParse(value) == null) {
//                             //double.prase() give error if it fails when this returns a null if it fails.
//                             return 'Please enter a valid Number';
//                           }
//                           if (double.parse(value) <= 0) {
//                             return 'Please enter a number greater than zero';
//                           }
//                           return null;
//                         },
//                         onSaved: (val) {
//                           _editedProduct = Product(
//                             description: _editedProduct.description,
//                             id: _editedProduct.id,
//                             image: _editedProduct.image,
//                             price: int.parse(val),
//                             title: _editedProduct.title,
//                             //isFavourite: _editedProduct.isFavourite,
//                           );
//                         },
//                       ),
//                       TextFormField(
//                         decoration: InputDecoration(
//                           labelText: 'Discount Price',
//                         ),
//                         initialValue: _initValues['discount'],
//                         keyboardType: TextInputType.number,
//                         textInputAction: TextInputAction.next,
//                         focusNode: _discNode,
//                         onFieldSubmitted: (_) {
//                           FocusScope.of(context).requestFocus(_discNode);
//                         },
//                         validator: (value) {
//                           if (value.isEmpty) {
//                             return 'Please enter a Number';
//                           }
//                           if (double.tryParse(value) == null) {
//                             //double.prase() give error if it fails when this returns a null if it fails.
//                             return 'Please enter a valid Number';
//                           }
//                           if (double.parse(value) < 0) {
//                             return 'Please enter a number greater than zero';
//                           }
//                           return null;
//                         },
//                         onSaved: (val) {
//                           _editedProduct = Product(
//                             description: _editedProduct.description,
//                             id: _editedProduct.id,
//                             image: _editedProduct.image,
//                             price: _editedProduct.price,
//                             title: _editedProduct.title,
//                             // discount: int.parse(val),
//                             //isFavourite: _editedProduct.isFavourite,
//                           );
//                         },
//                       ),
//                       TextFormField(
//                         decoration: InputDecoration(
//                           labelText: 'Description',
//                         ),
//                         initialValue: _initValues['description'],
//                         maxLines: 5,
//                         keyboardType: TextInputType.multiline,
//                         focusNode: _desNode,
//                         validator: (value) {
//                           if (value.isEmpty) {
//                             return 'Please enter a description';
//                           }
//                           if (value.length < 10) {
//                             return 'Description must have at least 10 characters';
//                           }
//                           return null;
//                         },
//                         onSaved: (val) {
//                           _editedProduct = Product(
//                             description: val,
//                             id: _editedProduct.id,
//                             image: _editedProduct.image,
//                             price: _editedProduct.price,
//                             title: _editedProduct.title,
//                             //isFavourite: _editedProduct.isFavourite,
//                           );
//                         },
//                       ),
//                       Container(
//                         margin: EdgeInsets.only(top: 15),
//                         padding: EdgeInsets.only(right: 50),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: Row(
//                           children: [
//                             Container(
//                               child: Text(
//                                 'Quantity',
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.w700, fontSize: 17),
//                               ),
//                               margin: EdgeInsets.only(right: 15),
//                             ),
//                             Container(
//                               child: DropdownButton<String>(
//                                 items: _number.map(
//                                   (String dropDownStringItem) {
//                                     return DropdownMenuItem<String>(
//                                       value: dropDownStringItem,
//                                       child: Text(
//                                         dropDownStringItem,
//                                         style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                 ).toList(),
//                                 onChanged: (String val) => {
//                                   setState(() {
//                                     this._currentColour = val;
//                                   }),
//                                 },
//                                 value: _currentNumber,
//                                 elevation: 15,
//                                 hint: Text('Select'),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       _isColour
//                           ? Container(
//                               margin: EdgeInsets.only(top: 15),
//                               padding: EdgeInsets.only(right: 50),
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: Row(
//                                 children: [
//                                   Container(
//                                     child: Text(
//                                       'Colour Options',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.w700,
//                                           fontSize: 17),
//                                     ),
//                                     margin: EdgeInsets.only(right: 15),
//                                   ),
//                                   DropdownButton<String>(
//                                     items: _colors.map(
//                                       (String dropDownStringItem) {
//                                         return DropdownMenuItem<String>(
//                                           value: dropDownStringItem,
//                                           child: Text(
//                                             dropDownStringItem,
//                                             style: TextStyle(
//                                               fontWeight: FontWeight.bold,
//                                             ),
//                                           ),
//                                         );
//                                       },
//                                     ).toList(),
//                                     onChanged: (String val) => {
//                                       setState(() {
//                                         this._currentColour = val;
//                                       }),
//                                     },
//                                     value: _currentColour,
//                                     elevation: 15,
//                                     hint: Text('Select'),
//                                   ),
//                                 ],
//                               ),
//                             )
//                           : SizedBox(
//                               height: 2,
//                             ),
//                       Container(
//                         margin: EdgeInsets.only(top: 15),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           color: Colors.blue.shade900,
//                         ),
//                         child: FlatButton(
//                           onPressed: _presentDatePicker,
//                           textColor: Colors.white,
//                           child: Text(
//                             'Choose Date!',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: <Widget>[
//                           // Container(
//                           //   width: 100,
//                           //   height: 100,
//                           //   margin: EdgeInsets.only(
//                           //     top: 8,
//                           //     right: 10,
//                           //   ),
//                           //   decoration: BoxDecoration(
//                           //     border: Border.all(
//                           //       width: 1,
//                           //       color: Colors.grey,
//                           //     ),
//                           //   ),
//                           //   child: Container(
//                           //     child: _imageUrlController.text.isEmpty
//                           //         ? Text('Preview')
//                           //         : FittedBox(
//                           //             child: Image.network(
//                           //               _imageUrlController.text,
//                           //               fit: BoxFit.cover,
//                           //             ),
//                           //           ),
//                           //   ),
//                           // ),
//                           Container(
//                             margin: EdgeInsets.only(top: 25),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(23),
//                               color: Colors.blue.shade900,
//                             ),
//                             child: FlatButton(
//                               child: Text(
//                                 'Choose Photo',
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               onPressed: () => (val) {
//                                 // _editedProduct = Product(
//                                 //   description: _editedProduct.description,
//                                 //   id: _editedProduct.id,
//                                 //   image: val,
//                                 //   price: _editedProduct.price,
//                                 //   title: _editedProduct.title,
//                                 //   //isFavourite: _editedProduct.isFavourite,
//                                 // );
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//     );
//   }
// }
