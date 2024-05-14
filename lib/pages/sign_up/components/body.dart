import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/components/custom_surfix_icon.dart';
import 'package:flutter_application_1/components/default_button.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/pages/login_succes/login_succes_screen.dart';
import 'package:flutter_application_1/services/authentication.dart'
    as authentication;
import 'package:flutter_application_1/size_config.dart';

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
                  "Kayıt Ol",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Aşağıda verilen bilgileriniz ile\nveya sosyal medyanız ile kayıt olun.",
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
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Kayıt Ol",
            press: isLoading ? null : _handleSignUp,
            isLoading: isLoading,
          ),
        ],
      ),
    );
  }

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
                content: Text('Kayıt Başarılı.'),
              ),
            );
          });
        }).catchError((error) {
          setState(() {
            isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Kayıt sırasında bir hata oluştu.'),
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
          return "Lütfen isminizi girin";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "İsim",
        hintText: "İsminizi girin",
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
          return "Lütfen soyisminizi girin";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Soyisim",
        hintText: "Soyisminizi girin",
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
          return "Lütfen telefon numaranızı girin";
        }
        return null;
      },
      decoration: InputDecoration(
          labelText: "Telefon Numarası",
          hintText: "Telefon numaranızı girin",
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
          return "Lütfen e-posta adresinizi girin";
        } else if (value != null && !emailValidatorRegExp.hasMatch(value)) {
          return "Geçersiz e-posta adresi";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "E-mail",
        hintText: "E-posta adresinizi girin",
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
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return "Lütfen bir şifre girin";
        } else if (value != null && value.length < 8) {
          return "Şifre en az 8 karakter olmalıdır";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Şifre",
        hintText: "Şifrenizi girin",
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
      obscureText: true,
      onSaved: (newValue) => confirmPassword = newValue,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Lütfen şifrenizi onaylayın";
        } else if (value != _passwordController.text) {
          return "Şifreler eşleşmiyor";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Şifre Onayla",
        hintText: "Şifrenizi tekrar girin",
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
          return "Lütfen T.C. Kimlik Numaranızı girin";
        } else if (value.length != 11) {
          return "T.C. Kimlik Numarası 11 haneli olmalıdır";
        } else if (!validateTCNumber(value)) {
          return "Geçersiz T.C. Kimlik Numarası";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "T.C. Kimlik No",
        hintText: "T.C. Kimlik Numaranızı girin",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          pngIcon: "assets/icons/Arturo-Wibawa-Akar-Person.512.png",
        ),
      ),
    );
  }
}
