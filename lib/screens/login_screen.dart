import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  String? _emailError;
  String? _passwordError;

  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;

  @override
  void initState() {
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'LOGIN',
          style: GoogleFonts.nunito(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back...',
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              'Enter email & password',
              style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  height: 1,
                  color: Colors.black38),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailTextController,
              keyboardType: TextInputType.emailAddress,
              style: GoogleFonts.nunito(),
              enabled: true,
              readOnly: false,
              onTap: () => print('Tapped'),
              textDirection: TextDirection.ltr,
              // textAlign: TextAlign.start,
              onChanged: (String value) {
                print('Value: $value');
              },
              textInputAction: TextInputAction.next,
              // onSubmitted: (String value) {
              //   print('Value: $value');
              // },
              autofocus: false,
              textCapitalization: TextCapitalization.none,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              //************************************
              // cursorWidth: 5,
              // cursorColor: Colors.pink,
              // cursorRadius: Radius.circular(10),
              // showCursor: true,
              //************************************
              // minLines: null,
              // maxLines: null,
              // expands: true,
              //************************************
              minLines: 1,
              maxLines: 1,
              //************************************
              // maxLength: 30,
              buildCounter: (BuildContext context,
                  {required int currentLength,
                  required int? maxLength,
                  required bool isFocused}) {
                return null;
                // return isFocused ? Text('$currentLength/$maxLength') : null;
              },
              //************************************
              decoration: InputDecoration(
                //************************************
                errorText: _emailError,
                errorStyle: GoogleFonts.nunito(),
                errorMaxLines: 1,
                //************************************
                // contentPadding: EdgeInsets.zero,
                // contentPadding: EdgeInsets.only(left: 20),
                // contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                // contentPadding: EdgeInsetsDirectional.only(start: 10,end: 10,top: 30,bottom: 30),
                //************************************
                // constraints: BoxConstraints(
                //   maxHeight: 80,
                // ),
                //************************************
                hintText: 'Email',
                hintMaxLines: 1,
                hintStyle: GoogleFonts.nunito(),
                hintTextDirection: TextDirection.ltr,
                //************************************
                // helperText: 'Ex: vp-email@vision.ps',
                // helperMaxLines: 1,
                // helperStyle: GoogleFonts.nunito(),
                //************************************
                // labelText: 'Email',
                // labelStyle: GoogleFonts.nunito(),
                // floatingLabelBehavior: FloatingLabelBehavior.auto,
                // floatingLabelAlignment: FloatingLabelAlignment.start,
                // floatingLabelStyle: GoogleFonts.nunito(),
                //************************************
                prefixIcon: const Icon(Icons.email),
                // prefixText: 'vp-',
                // prefix: Icon(Icons.email),
                // icon: Icon(Icons.email),
                //************************************
                // suffixIcon: Icon(Icons.check),
                // suffixText: 'Text',
                // suffix: Icon(Icons.send),
                //************************************
                // border: InputBorder.none
                // border: UnderlineInputBorder()
                // border: OutlineInputBorder(
                //   borderRadius: BorderRadius.circular(10),
                // ),
                //************************************
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.blue.shade900,
                    width: 1,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red.shade300,
                    width: 1,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red.shade900,
                    width: 1,
                  ),
                ),
                //************************************
                // enabled: false,
                // fillColor: Colors.grey.withOpacity(0.4),
                // filled: true,
                //************************************
                // counterText: ''
              ),
              //************************************
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordTextController,
              keyboardType: TextInputType.text,
              obscureText: _obscurePassword,
              style: GoogleFonts.nunito(),
              textInputAction: TextInputAction.send,
              onSubmitted: (String value) => _performLogin(),
              decoration: InputDecoration(
                errorText: _passwordError,
                errorStyle: GoogleFonts.nunito(),
                errorMaxLines: 1,
                hintText: 'Password',
                hintStyle: GoogleFonts.nunito(),
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() => _obscurePassword = !_obscurePassword);
                  },
                  icon: Icon(
                    _obscurePassword ? Icons.visibility : Icons.visibility_off,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.blue,
                    width: 1,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red.shade300,
                    width: 1,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.red.shade900,
                    width: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _performLogin(),
              child: const Text('LOGIN'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue.shade800,
                minimumSize: const Size(double.infinity, 45),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //SOLID - (S) => Single Responsibility
  void _performLogin() {
    if (_checkData()) {
      _login();
    }
  }

  bool _checkData() {
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      _setErrors();
      return true;
    }
    _setErrors();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Enter required data!',
          style: GoogleFonts.nunito(),
        ),
        backgroundColor: Colors.red,
        // padding: EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
        duration: Duration(seconds: 3),
        elevation: 5,
        onVisible: () => print('Visible Snackbar'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
        // action: SnackBarAction(
        //   onPressed: () => print('UNDO ACTION'),
        //   label: 'UNDO',
        //   textColor: Colors.yellow,
        // ),
      ),
    );
    return false;
  }

  void _setErrors() {
    setState(() {
      _emailError = _emailTextController.text.isEmpty ? 'Enter email' : null;
      _passwordError = _passwordTextController.text.isEmpty ? 'Enter password' : null;
    });
  }

  void _login() {
    Navigator.pushReplacementNamed(context, '/bottom_navigation_screen');
  }
}
