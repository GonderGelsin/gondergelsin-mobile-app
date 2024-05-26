import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/custom_surfix_icon.dart';
import 'package:flutter_application_1/components/default_button.dart';
import 'package:flutter_application_1/components/form_error.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_application_1/pages/forgot_password/forgot_password_screen.dart';
import 'package:flutter_application_1/pages/home/home_screen.dart';
import 'package:flutter_application_1/services/authentication.dart'
    as authentication;
import 'package:flutter_application_1/size_config.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key});

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email = "";
  String? password = "";
  bool? remember = false;
  bool? showPassword = false;
  final List<String> errors = [];

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false; // isLoading durumu eklendi

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: showPassword,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    showPassword = value;
                  });
                },
              ),
              Text("Şifreyi Göster"),
            ],
          ),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Beni Hatırla"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Şifremi Unuttum",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Giriş Yap",
            press:
                isLoading ? null : _handleSignIn, // isLoading kontrol ediliyor
            isLoading: isLoading, // isLoading durumu geçiriliyor
          ),
        ],
      ),
    );
  }

  void _handleSignIn() {
    final form = _formKey.currentState;
    if (form != null && form.validate()) {
      form.save();
      setState(() {
        isLoading = true;
      });

      authentication
          .signUserIn(context, _emailController, _passwordController)
          .then((response) {
        setState(() {
          isLoading = false;
        });
        Navigator.pushNamed(context, HomePage.routeName).then((value) {
          if (value != null && value == true) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Giriş Başarılı.'),
              ),
            );
          }
        });
      }).catchError((error) {
        setState(() {
          isLoading = false;
        });
        String errorMessage;
        if (error is authentication.SignInException) {
          errorMessage = error.message;
        } else {
          errorMessage = 'Bilinmeyen bir hata oluştu.';
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage),
          ),
        );
      });
    }
  }

  // PASSWORD
  TextFormField buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: !(showPassword ?? false),
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kPassNullError)) {
          setState(() {
            errors.remove(kPassNullError);
          });
        } else if (value.length >= 8 && errors.contains(kShortPassError)) {
          setState(() {
            errors.remove(kShortPassError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value != null && value.isEmpty) {
          return kPassNullError;
        } else if (value != null && value.length < 8) {
          return kShortPassError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Şifre",
        hintText: "Şifreniz",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          pngIcon: "assets/icons/Arturo-Wibawa-Akar-Lock-on.512.png",
        ),
        // Hata durumunda gösterilecek ikon ve stil
        errorStyle: TextStyle(height: 0), // Hata stilini kaldır
        errorBorder: OutlineInputBorder(
          // Hata sınırlayıcısı
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          // Odaklandığında hata sınırlayıcısı
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }

  // EMAIL
  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      validator: (value) {
        if (value != null && value.isEmpty) {
          return kEmailNullError;
        } else if (value != null && !emailValidatorRegExp.hasMatch(value)) {
          return kInvalidEmailError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "E-mail",
        hintText: "E-postanız",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(
          pngIcon: "assets/icons/Arturo-Wibawa-Akar-Envelope.512.png",
        ),
        // Hata durumunda gösterilecek ikon ve stil
        errorStyle: TextStyle(height: 0),

        // Hata stilini kaldır
        errorBorder: OutlineInputBorder(
          // Hata sınırlayıcısı
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          // Odaklandığında hata sınırlayıcısı
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
