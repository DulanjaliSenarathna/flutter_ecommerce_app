import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/data/repositories/address/address_repository.dart';
import 'package:t_store/features/personalization/models/address_model.dart';
import 'package:t_store/features/personalization/screens/address/add_new_address.dart';
import 'package:t_store/features/personalization/screens/address/widgets/single_address.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/cloud_helper_functions.dart';
import 'package:t_store/utils/helpers/network_manager.dart';
import 'package:t_store/utils/popups/full_screen_loader.dart';
import 'package:t_store/utils/popups/loaders.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final postalCode = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  RxBool refreshData = true.obs;
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  // fetch all user specific addresses
  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();
      selectedAddress.value = addresses.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());
      return addresses;
    } catch (e) {
      Loaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      // Clear the selected field
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }

      // Assign selected value
      newSelectedAddress.selectedAddress = true;
      selectedAddress.value = newSelectedAddress;

      // set the 'selected' field to true for the newly selected address
      await addressRepository.updateSelectedField(
          selectedAddress.value.id, true);
    } catch (e) {
      Loaders.errorSnackBar(title: 'Error in selection', message: e.toString());
    }
  }

  // Add new address
  Future addNewAddress() async {
    try {
      // Start loading
      FullScreenLoader.openLoadingDialog(
          'Storing address...', TImages.docerAnimation);

      // Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!addressFormKey.currentState!.validate()) {
        FullScreenLoader.stopLoading();
        return;
      }

      // Save address data
      final address = AddressModel(
          id: '',
          name: name.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          street: street.text.trim(),
          city: city.text.trim(),
          state: state.text.trim(),
          postalCode: postalCode.text.trim(),
          country: country.text.trim(),
          selectedAddress: true);

      final id = await addressRepository.addAddress(address);

      // update selected address status
      address.id = id;
      await selectAddress(address);

      //Remove loader
      FullScreenLoader.stopLoading();

      //show success message
      Loaders.successSnackBar(
          title: 'Congratulations!',
          message: 'Your address has been saved successfully');

      // Refresh address data
      refreshData.toggle();

      // reset fields
      resetFormFields();

      // redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      // Remove loader
      FullScreenLoader.stopLoading();
      Loaders.errorSnackBar(title: 'Address not found', message: e.toString());
    }
  }

  // Show address ModalBottomSheet at Checkout
  Future<dynamic> selectNewAddressPopup(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => Container(
              padding: const EdgeInsets.all(TSizes.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TSectionHeading(title: 'Select Address', showActionButton: false,),
                  FutureBuilder(
                      future: getAllUserAddresses(),
                      builder: (_, snapshot) {
                        // Helper function, handle loader,no record,or error message
                        final response =
                            TCloudHelperFunctions.checkMultiRecordState(
                                snapshot: snapshot);
              
                        if (response != null) return response;
              
                        return ListView.builder(
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (_, index) => SingleAddress(
                                address: snapshot.data![index],
                                onTap: () async {
                                  await selectAddress(snapshot.data![index]);
                                  Get.back();
                                }
                                ),
                                );
                      }
                      ),
                      const SizedBox(height: TSizes.defaultSpace*2,),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(onPressed: ()=>Get.to(()=> const AddNewAddressScreen()),child: const Text('Add New Address'),),
                      )
                ],
              ),
            ));
  }

  //function to reset form fields
  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }
}
