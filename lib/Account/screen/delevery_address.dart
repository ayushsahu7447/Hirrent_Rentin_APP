// import 'package:flutter/material.dart';
//
// class Address {
//   final String name;
//   final String address;
//   final String city;
//   final String state;
//   final String zipCode;
//
//   Address({required this.name, required this.address, required this.city, required this.state, required this.zipCode});
// }
//
// List<Address> addresses = [
//   Address(
//       name: 'John Doe',
//       address: '123 Main St',
//       city: 'Anytown',
//       state: 'CA',
//       zipCode: '12345'),
//   Address(
//       name: 'Jane Smith',
//       address: '456 Oak Ave',
//       city: 'Anytown',
//       state: 'CA',
//       zipCode: '67890'),
//   Address(
//       name: 'Bob Johnson',
//       address: '789 Elm St',
//       city: 'Anytown',
//       state: 'CA',
//       zipCode: '13579'),
// ];
//
// class DeliveryAddressPage extends StatefulWidget {
//   @override
//   _DeliveryAddressPageState createState() => _DeliveryAddressPageState();
// }
//
// class _DeliveryAddressPageState extends State<DeliveryAddressPage> {
//   Address? selectedAddress;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Choose Delivery Address'),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: ListView.builder(
//               itemCount: addresses.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final address = addresses[index];
//                 return RadioListTile(
//                   title: Text(address.name),
//                   subtitle: Text('${address.address}, ${address.city}, ${address.state} ${address.zipCode}'),
//                   value: address,
//                   groupValue: selectedAddress,
//                   onChanged: (Address? value) {
//                     setState(() {
//                       selectedAddress = value;
//                     });
//                   },
//                 );
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: ElevatedButton(
//               onPressed: () {
//                 // Handle the selection of the address here
//                 if (selectedAddress != null) {
//                   // Do something with the selected address
//                 }
//               },
//               child: Text('Deliver to this Address'),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// Model class for the delivery address
class DeliveryAddress {
  String addressLine1;
  String addressLine2;
  String city;
  String state;
  String postalCode;
  String country;
  bool isSelected;

  DeliveryAddress({
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    this.isSelected = false,
  });
}

// Delivery address choice page widget
class DeliveryAddressChoicePage extends StatefulWidget {
  @override
  _DeliveryAddressChoicePageState createState() =>
      _DeliveryAddressChoicePageState();
}

class _DeliveryAddressChoicePageState extends State<DeliveryAddressChoicePage> {
  List<DeliveryAddress> deliveryAddresses = [
    DeliveryAddress(
      addressLine1: '123 Main St',
      addressLine2: 'Apt 456 wasve Apt 456 wasve Apt 456 wasve Apt 456 wasve Apt 456 wasve Apt 456 wasve Apt 456 wasve Apt 456 wasve Apt 456 wasve Apt 456 wasve Apt 456 wasve ',
      city: 'Anytown',
      state: 'CA',
      postalCode: '12345',
      country: 'USA',
      isSelected: true,
    ),
    DeliveryAddress(
      addressLine1: '789 Market St',
      addressLine2: 'Apt 456 wasve Apt 456 wasve Apt 456 wasve Apt 456 wasve Apt 456 wasve Apt 456 wasve Apt 456 wasve Apt 456 wasve Apt 456 wasve Apt 456 wasve Apt 456 wasve Apt 456 wasve ',
      city: 'Anytown',
      state: 'CA',
      postalCode: '67890',
      country: 'USA',
    ),
  ];

  int selectedAddressIndex = 0;

  // Callback for selecting a different delivery address
  void _onAddressSelected(int index) {
    setState(() {
      deliveryAddresses[selectedAddressIndex].isSelected = false;
      deliveryAddresses[index].isSelected = true;
      selectedAddressIndex = index;
    });
  }

  // Callback for editing a delivery address
  void _onEditAddress(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditAddressPage(
          deliveryAddress: deliveryAddresses[index],
        ),
      ),
    ).then((updatedAddress) {
      if (updatedAddress != null) {
        setState(() {
          deliveryAddresses[index] = updatedAddress;
        });
      }
    });
  }

  // Callback for adding a new delivery address
  void _onAddNewAddress() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddAddressPage(),
      ),
    ).then((newAddress) {
      if (newAddress != null) {
        setState(() {
          deliveryAddresses.add(newAddress);
          selectedAddressIndex = deliveryAddresses.length - 1;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back_ios_outlined , size: 20,color: Colors.black,),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              "assets/svg/Icon.svg",color: Colors.black , height: 22,width: 22,
            ),
          )
        ],
        title: Row(
          children: [
            Text("Delivery Address", style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold, fontSize: 16),)
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: deliveryAddresses.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.grey[100],borderRadius: BorderRadius.all(Radius.circular(5))),
              child: Column(
                children: [
                  Row(
                    children: [
                      Radio(
                        activeColor: Colors.deepPurple,
                        value: index,
                        groupValue: selectedAddressIndex,
                        onChanged: (value) => _onAddressSelected(value as int),
                      ),
                      Text(deliveryAddresses[index].addressLine1, style:  TextStyle(color: Colors.black ,fontWeight: FontWeight.w600, fontSize: 16),),
                    ],
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20 ,),
                    child: Row(
                      children: [
                        Expanded(child: Text(deliveryAddresses[index].addressLine2 , style:  TextStyle(color: Colors.black ,fontWeight: FontWeight.w300, fontSize: 12)))
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 10,left: 20.0, right: 20 ,),
                    child: Row(
                      children: [
                        Expanded(child: Text(deliveryAddresses[index].city , style:  TextStyle(color: Colors.deepPurple ,fontWeight: FontWeight.w500, fontSize: 12)))
                      ],
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 20 ,),
                    child: Row(
                      children: [
                        Expanded(child: Text("Postal Code :  "'${deliveryAddresses[index].postalCode}' , style:  TextStyle(color: Colors.deepPurple ,fontWeight: FontWeight.w500, fontSize: 12)))
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: ()=> _onEditAddress(index),
                    child: Padding(
                      padding: EdgeInsets.only(top: 10,left: 20.0, right: 20 ,),
                      child: Row(
                        children: [
                          Text("Edit",style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12, ),),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.edit,color: Colors.deepPurple,size: 15,),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
          return ListTile(
            leading: Radio(
              value: index,
              groupValue: selectedAddressIndex,
              onChanged: (value) => _onAddressSelected(value as int),
            ),
            title: Text(deliveryAddresses[index].addressLine1),
            subtitle: Text(
              '${deliveryAddresses[index].city}, ${deliveryAddresses[index].state}, ${deliveryAddresses[index].postalCode}',
            ),
            trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => _onEditAddress(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.add),
        onPressed: _onAddNewAddress,
      ),
    );
  }
}

// Edit address page widget
class EditAddressPage extends StatefulWidget {
  final DeliveryAddress deliveryAddress;

  EditAddressPage ({required this.deliveryAddress});

  @override
  _EditAddressPageState createState() => _EditAddressPageState();
}

class _EditAddressPageState extends State<EditAddressPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _addressLine1Controller;
  late TextEditingController _addressLine2Controller;
  late TextEditingController _cityController;
  late TextEditingController _stateController;
  late TextEditingController _postalCodeController;
  late TextEditingController _countryController;

  @override
  void initState() {
    super.initState();

    _addressLine1Controller = TextEditingController(
        text: widget.deliveryAddress.addressLine1);
    _addressLine2Controller = TextEditingController(
        text: widget.deliveryAddress.addressLine2);
    _cityController =
        TextEditingController(text: widget.deliveryAddress.city);
    _stateController =
        TextEditingController(text: widget.deliveryAddress.state);
    _postalCodeController =
        TextEditingController(text: widget.deliveryAddress.postalCode);
    _countryController =
        TextEditingController(text: widget.deliveryAddress.country);
  }

  @override
  void dispose() {
    _addressLine1Controller.dispose();
    _addressLine2Controller.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _postalCodeController.dispose();
    _countryController.dispose();
    super.dispose();
  }

  void _onSavePressed() {
    if (_formKey.currentState!.validate()) {
      final updatedAddress = DeliveryAddress(
        addressLine1: _addressLine1Controller.text,
        addressLine2: _addressLine2Controller.text,
        city: _cityController.text,
        state: _stateController.text,
        postalCode: _postalCodeController.text,
        country: _countryController.text,
        isSelected: widget.deliveryAddress.isSelected,
      );

      Navigator.pop(context, updatedAddress);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text('Edit Address',style:TextStyle(color: Colors.black),),
        ),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
    child: Form(
    key: _formKey,
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    TextFormField(
    controller: _addressLine1Controller,
    decoration: InputDecoration(
    labelText: 'Address Line 1',
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter address line 1';
    }
    return null;
    },
    ),
    TextFormField(
    controller: _addressLine2Controller,
    decoration: InputDecoration(
    labelText: 'Address Line 2',
    ),
    ),
    TextFormField(
    controller: _cityController,
    decoration: InputDecoration(
    labelText: 'City',
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter city';
    }
    return null;
    },
    ),
    TextFormField(
    controller: _stateController,
    decoration: InputDecoration(
    labelText: 'State',
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter state';
    }
    return null;
    },
    ),
    TextFormField(
    controller: _postalCodeController,
    decoration: InputDecoration(
    labelText: 'Postal Code',
    ),
    validator: (value) {
    if (value == null || value.isEmpty) {
    return 'Please enter postal code';
    }
    return null;
    },
    ),
    TextFormField(
    controller: _countryController,
    decoration: InputDecoration(
    labelText: 'Country',
    ),
    validator: (value) {
    if (value == null || value.isEmpty){
      return 'Please enter country';
    }
    return null;
    },
    ),
      SizedBox(height: 16),
      ElevatedButton(
        onPressed: _onSavePressed,
        child: Text('Save'),
      ),
    ],
    ),
    ),
        ),
    );
  }
}

class AddAddressPage extends StatefulWidget {
  @override
  _AddAddressPageState createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _addressLine1Controller;
  late TextEditingController _addressLine2Controller;
  late TextEditingController _cityController;
  late TextEditingController _stateController;
  late TextEditingController _postalCodeController;
  late TextEditingController _countryController;

  @override
  void initState() {
    super.initState();
    _addressLine1Controller = TextEditingController();
    _addressLine2Controller = TextEditingController();
    _cityController = TextEditingController();
    _stateController = TextEditingController();
    _postalCodeController = TextEditingController();
    _countryController = TextEditingController();
  }

  @override
  void dispose() {
    _addressLine1Controller.dispose();
    _addressLine2Controller.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _postalCodeController.dispose();
    _countryController.dispose();
    super.dispose();
  }

// Callback for adding the new address
  void _onAddPressed() {
    if (_formKey.currentState!.validate()) {
      final newAddress = DeliveryAddress(
        addressLine1: _addressLine1Controller.text,
        addressLine2: _addressLine2Controller.text,
        city: _cityController.text,
        state: _stateController.text,
        postalCode: _postalCodeController.text,
        country: _countryController.text,
        isSelected: false,
      );
      Navigator.pop(context, newAddress);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Add New Address', style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _addressLine1Controller,
                decoration: InputDecoration(
                  labelText: 'Address Line 1',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter address line 1';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _addressLine2Controller,
                decoration: InputDecoration(
                  labelText: 'Address Line 2',
                ),
              ),
              TextFormField(
                controller: _cityController,
                decoration: InputDecoration(
                  labelText: 'City',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter city';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _stateController,
                decoration: InputDecoration(
                  labelText: 'State',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter state';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _postalCodeController,
                decoration: InputDecoration(
                  labelText: 'Postal Code',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter postal code';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _countryController,
                decoration: InputDecoration(
                  labelText: 'Country',
                ), validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter country';
                }
                return null;
              },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _onAddPressed,
                child: Text('Add'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




