import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({required this.onPressed, required this.buttonTitle});

  final VoidCallback onPressed;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: MaterialButton(
        color: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        onPressed: onPressed,
        height: 50.0,
        child: Text(
          buttonTitle,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}


class LoginInput extends StatelessWidget {
  const LoginInput({ required this.hintText, required this.onChanged, this.obscureText });

  final String hintText;
  final void Function(String) onChanged;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      obscureText: obscureText ?? false,
      onChanged: onChanged,
      style: TextStyle(color: Theme.of(context).colorScheme.secondary),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey),
        contentPadding:
        const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: Theme.of(context).colorScheme.primary, width: 1.0),
          borderRadius: const BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
          BorderSide(color: Theme.of(context).colorScheme.tertiary, width: 2.0),
          borderRadius: const BorderRadius.all(Radius.circular(40.0)),
        ),
      ),
    );
  }
}
