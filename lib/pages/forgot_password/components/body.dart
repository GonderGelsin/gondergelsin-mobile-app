import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gonder_gelsin_application/components/custom_surfix_icon.dart';
import 'package:gonder_gelsin_application/components/default_button.dart';
import 'package:gonder_gelsin_application/components/form_error.dart';
import 'package:gonder_gelsin_application/components/no_account_text.dart';
import 'package:gonder_gelsin_application/constants.dart';
import 'package:gonder_gelsin_application/size_config.dart';

import '../../../translations/locale_keys.g.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(100)),
              Text(
                LocaleKeys.forgot_password.tr(),
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(28),
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                LocaleKeys.enter_email_to_recover.tr(),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  @override
  State<ForgotPassForm> createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  String? email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue,
            onChanged: (value) {
              if ((value.isNotEmpty) && errors.contains(kEmailNullError)) {
                setState(() {
                  errors.remove(kEmailNullError);
                });
              } else if (emailValidatorRegExp.hasMatch(value) &&
                  errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.remove(kInvalidEmailError);
                });
              }
              return null;
            },
            validator: (value) {
              if (value != null &&
                  value.isEmpty &&
                  !errors.contains(kEmailNullError)) {
                setState(() {
                  errors.add(kEmailNullError);
                });
              } else if (value != null &&
                  !emailValidatorRegExp.hasMatch(value) &&
                  !errors.contains(kInvalidEmailError)) {
                setState(() {
                  errors.add(kInvalidEmailError);
                });
              }
              return null;
            },
            decoration: InputDecoration(
              labelText: LocaleKeys.email.tr(),
              hintText: LocaleKeys.your_email.tr(),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: CustomSurffixIcon(
                pngIcon: "assets/icons/Arturo-Wibawa-Akar-Envelope.512.png",
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          DefaultButton(
            text: LocaleKeys.continue_.tr(),
            press: () {
              final form = _formKey.currentState;
              if (form != null) {
                if (form.validate()) {
                  form.save();
                }
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          NoAccountText(),
        ],
      ),
    );
  }
}
