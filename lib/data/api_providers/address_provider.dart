import 'package:hive_flutter/hive_flutter.dart';

class AddressProvider {
  Box addressBox = Hive.box('addressBox');
  List fetchAddresses() {
    final List addressList =
        addressBox.isNotEmpty ? addressBox.get('addressBox') : [];
    return addressList;
  }
}
