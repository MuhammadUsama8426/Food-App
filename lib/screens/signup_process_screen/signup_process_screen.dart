import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../theme/custom_button_style.dart';
import '../../widgets/app_bar/appbar_leading_iconbutton.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_elevated_button.dart';

class SignupProcessScreen extends StatefulWidget {
  const SignupProcessScreen(BuildContext context, {super.key});

  @override
  _SignupProcessScreenState createState() => _SignupProcessScreenState();
}

class _SignupProcessScreenState extends State<SignupProcessScreen> {
  final _formKey = GlobalKey<FormState>(); // Key to manage the form state

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        appBar: buildAppbar(context), // Set the AppBar
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                    left: 20, right: 14, top: 40, bottom: 90),
                child: Form(
                  key: _formKey, // Added Form widget to wrap the content
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Fill in your bio to get started",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "This data will be displayed in your account profile for security",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(height: 22),
                      buildFirstName(),
                      const SizedBox(height: 20),
                      buildLastName(),
                      const SizedBox(height: 20),
                      buildMobileNumber(),
                    ],
                  ),
                ),
              ),
            ),
            // Next button
            Padding(
              padding: const EdgeInsets.only(
                  bottom: 50), // Adjust the bottom padding
              child: Center(
                child: buildNext(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget buildAppbar(BuildContext context) {
    return CustomAppBar(
      leadingWidth: 69,
      leading: AppbarLeadingIconButton(
        imagePath: ImageConstant.imgVector,
        margin: const EdgeInsets.only(left: 20),
        onTap: () {
          NavigatorService.goBack();
        },
      ),
    );
  }

  Widget buildFirstName() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "First Name",
        contentPadding: const EdgeInsets.all(20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter a valid text";
        }
        return null;
      },
    );
  }

  Widget buildLastName() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Last Name",
        contentPadding: const EdgeInsets.all(20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter a valid text";
        }
        return null;
      },
    );
  }

  Widget buildMobileNumber() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Mobile Number",
        contentPadding: const EdgeInsets.all(20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.done,
      validator: (value) {
        if (value == null ||
            value.isEmpty ||
            !RegExp(r'^[0-9]+$').hasMatch(value)) {
          return "Please enter a valid phone number";
        }
        return null;
      },
    );
  }

  Widget buildNext() {
    return CustomElevatedButton(
      width: 156,
      text: "Next",
      buttonStyle: CustomButtonStyles.none,
      decoration: CustomButtonStyles.gradientGreenAToPrimaryDecoration,
      onPressed: () {
        if (_formKey.currentState?.validate() ?? false) {
          NavigatorService.goBack();
        }
      },
    );
  }
}
