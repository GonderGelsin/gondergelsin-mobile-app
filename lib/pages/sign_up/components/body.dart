import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/components/custom_surfix_icon.dart';
import 'package:flutter_application_1/components/default_button.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/pages/login_succes/login_succes_screen.dart';
import 'package:flutter_application_1/services/authentication.dart'
    as authentication;
import 'package:flutter_application_1/size_config.dart';
import 'package:flutter_application_1/translations/locale_keys.g.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(20)),
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                Text(
                  LocaleKeys.register.tr(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  LocaleKeys.register_with_email_or_social.tr(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
                SizedBox(height: getProportionateScreenHeight(10)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? confirmPassword;
  String? name;
  String? surname;
  String? phoneNumber;
  String? tcNumber;
  bool isLoading = false;
  bool? showPassword = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _tcController = TextEditingController();

  bool validateTCNumber(String value) {
    // T.C. Kimlik Numarası doğrulama algoritmasını buraya ekleyin
    if (value.length != 11) return false;
    int sum = 0;
    for (int i = 0; i < 10; i++) {
      sum += int.parse(value[i]);
    }
    return (sum % 10 == int.parse(value[10]));
  }

  Row buildShowPasswordRow() {
    return Row(
      children: [
        Checkbox(
          value: showPassword,
          onChanged: (value) {
            setState(() {
              showPassword = value;
            });
          },
        ),
        Text(LocaleKeys.show_password.tr()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildTCFormField(),
          SizedBox(
            height: getProportionateScreenHeight(20),
          ),
          buildNameFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildSurnameFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPasswordField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildConfirmPasswordField(),
          SizedBox(height: getProportionateScreenHeight(10)),
          buildShowPasswordRow(),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: LocaleKeys.register.tr(),
            press: isLoading ? null : _handleSignUp,
            isLoading: isLoading,
          ),
          // googleSignInButton(),

        ],
      ),
    );
  }

//   Row googleSignInButton() {
//     return Row(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
//   GestureDetector(
//     onTap: _handleGoogleSignIn,
//     child: Container(
//       padding: EdgeInsets.all(8.0),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(4),
//         color: Colors.white,
//         border: Border.all(color: Colors.grey),
//       ),
//       child: Row(
//         children: [
//           Image.asset(
//             'assets/images/search.png',
//             height: 20,
//           ),
//           SizedBox(width: 10),
//           Text(
//             "Deneme",
//             style: TextStyle(fontSize: 16),
//           ),
//         ],
//       ),
//     ),
//   ),
// ],
// );
//   }

//   Future<void> _handleGoogleSignIn() async {
//   try {
//     setState(() {
//       isLoading = true;
//     });

//     final googleUser = await GoogleSignIn().signIn();
//     if (googleUser == null) {
//       // The user canceled the sign-in
//       setState(() {
//         isLoading = false;
//       });
//       return;
//     }

//     final googleAuth = await googleUser.authentication;
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth.accessToken,
//       idToken: googleAuth.idToken,
//     );

//     await FirebaseAuth.instance.signInWithCredential(credential);

//     // After successful sign-in, navigate to the success screen
//     Navigator.pushReplacementNamed(
//       context,
//       LoginSuccesScreen.routeName,
//     ).then((value) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(LocaleKeys.register_successful.tr()),
//         ),
//       );
//     });
//   } catch (e) {
//     setState(() {
//       isLoading = false;
//     });
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(LocaleKeys.registration_error_occurred.tr()),
//       ),
//     );
//   }
// }

  void _handleSignUp() {
    final form = _formKey.currentState;
    if (form != null) {
      if (form.validate()) {
        form.save();
        setState(() {
          isLoading = true;
        });

        authentication
            .register(_tcController, _nameController, _surnameController,
                _phoneNumberController, _emailController, _passwordController)
            .then((response) {
          setState(() {
            isLoading = false;
          });

          // Burada SnackBar'ı göstermeden önce yeni sayfaya geçiş yapabilirsiniz
          Navigator.pushReplacementNamed(
            context,
            LoginSuccesScreen.routeName,
          ).then((value) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(LocaleKeys.register_successful.tr()),
              ),
            );
          });
        }).catchError((error) {
          setState(() {
            isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(LocaleKeys.registration_error_occurred.tr(),),
            ),
          );
        });
      }
    }
  }

  TextFormField buildNameFormField() {
    return TextFormField(
      controller: _nameController,
      onSaved: (newValue) => name = newValue,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return LocaleKeys.enter_first_name.tr();
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: LocaleKeys.first_name_label.tr(),
        hintText: LocaleKeys.enter_your_name.tr(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          pngIcon: "assets/icons/Arturo-Wibawa-Akar-Person.512.png",
        ),
      ),
    );
  }

  TextFormField buildSurnameFormField() {
    return TextFormField(
      controller: _surnameController,
      onSaved: (newValue) => surname = newValue,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return LocaleKeys.enter_last_name.tr();
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: LocaleKeys.last_name.tr(),
        hintText: LocaleKeys.enter_last_name.tr(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          pngIcon: "assets/icons/Arturo-Wibawa-Akar-Person.512.png",
        ),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      controller: _phoneNumberController,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        LengthLimitingTextInputFormatter(11), // Maksimum 11 karakter
      ],
      onSaved: (newValue) => phoneNumber = newValue,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return LocaleKeys.enter_phone.tr();
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: LocaleKeys.phone_number.tr(),
          hintText: LocaleKeys.enter_phone.tr(),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: CustomSurffixIcon(
            pngIcon: "assets/icons/Arturo-Wibawa-Akar-Phone.512.png",
          )),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return LocaleKeys.enter_email.tr();
        } else if (value != null && !emailValidatorRegExp.hasMatch(value)) {
          return LocaleKeys.invalid_email.tr();
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: LocaleKeys.email_label.tr(),
        hintText: LocaleKeys.enter_email.tr(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          pngIcon: "assets/icons/Arturo-Wibawa-Akar-Envelope.512.png",
        ),
      ),
    );
  }

  TextFormField buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: !(showPassword ?? false),
      onSaved: (newValue) => password = newValue,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return LocaleKeys.enter_password.tr();
        } else if (value != null && value.length < 8) {
          return LocaleKeys.password_min_length.tr();
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: LocaleKeys.password.tr(),
        hintText: LocaleKeys.enter_password.tr(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          pngIcon: "assets/icons/Arturo-Wibawa-Akar-Lock-on.512.png",
        ),
      ),
    );
  }

  TextFormField buildConfirmPasswordField() {
    return TextFormField(
      controller: _confirmPasswordController,
      obscureText: !(showPassword ?? false),
      onSaved: (newValue) => confirmPassword = newValue,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return LocaleKeys.confirm_password.tr();
        } else if (value != _passwordController.text) {
          return LocaleKeys.passwords_not_matching.tr();
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: LocaleKeys.confirm_password.tr(),
        hintText: LocaleKeys.re_enter_your_password.tr(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          pngIcon: "assets/icons/Arturo-Wibawa-Akar-Double-check.512.png",
        ),
      ),
    );
  }

  TextFormField buildTCFormField() {
    return TextFormField(
      controller: _tcController,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.allow(
            RegExp(r'[0-9]')), // Yalnızca rakamları kabul et
        LengthLimitingTextInputFormatter(11)
      ], // Maksimum 11 karaktere sınırlama
      onSaved: (newValue) => tcNumber = newValue,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return LocaleKeys.enter_id_no.tr();
        } else if (value.length != 11) {
          return LocaleKeys.id_must_be_11_digits.tr();
        } else if (!validateTCNumber(value)) {
          return LocaleKeys.invalid_id.tr();
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: LocaleKeys.id_no.tr(),
        hintText: LocaleKeys.enter_id_no.tr(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          pngIcon: "assets/icons/Arturo-Wibawa-Akar-Person.512.png",
        ),
      ),
    );
  }
}
