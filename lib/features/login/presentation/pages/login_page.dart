import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lyqx_test_task/features/login/presentation/bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginLoaded) {
          GoRouter.of(context).push('/home_screen');
        }
      },
      child: Scaffold(
          appBar: AppBar(leading: Icon(Icons.arrow_back_ios)),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      'Welcome back! Glad to see you, Again!',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: 24),
                    AppInput(
                      placeholder: 'Enter your email',
                    ),
                    SizedBox(height: 16),
                    AppInput(
                      placeholder: 'Enter your password',
                      isPassword: true,
                    ),
                    SizedBox(height: 32),
                    AppButton(
                      text: 'Login',
                      onTap: () {
                        context.read<LoginBloc>().add(
                              const AddUserEvent(
                                param: (
                                  email: 'me@gmail.com',
                                  password: '123456',
                                ),
                              ),
                            );
                      },
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

class AppButton extends StatelessWidget {
  final String text;
  void Function()? onTap;
  AppButton({
    super.key,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 48,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: const Color(0XFF1E1E1E),
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Color(0XFFF8F7FA),
            ),
          ),
        ),
      ),
    );
  }
}

class AppInput extends StatefulWidget {
  final String? label;
  final String placeholder;
  final String? error;
  final bool isPassword;
  final bool disabled;
  final int? maxLines;
  final TextEditingController? controller;
  final Color? backgroundColor;
  final Function(String)? onChanged;

  const AppInput({
    super.key,
    this.label,
    this.placeholder = '',
    this.error,
    this.isPassword = false,
    this.disabled = false,
    this.maxLines = 1,
    this.controller,
    this.backgroundColor = Colors.black,

    // const Color(0XFFF7F8F9),
    this.onChanged,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null && widget.label!.isNotEmpty)
          Text(
            widget.label!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        if (widget.label != null && widget.label!.isNotEmpty)
          const SizedBox(height: 8),
        TextField(
          controller: widget.controller,
          cursorColor: Colors.blue,
          enabled: !widget.disabled,
          obscureText: widget.isPassword,
          onChanged: widget.onChanged,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            // suffixIcon: widget.isPassword
            //     ? Icon(CupertinoIcons.eye)
            //     : Icon(CupertinoIcons.eye_slash),
            hintText: widget.placeholder,
            filled: true,
            fillColor: const Color(0XFFF7F8F9),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(width: 0.5, color: Color(0XFFE8ECF4)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide:
                  const BorderSide(width: 0.5, color: Color(0XFFE8ECF4)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                width: 1.2,
                color: Color(0XFFE8ECF4),
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(width: 1, color: Color(0XFFE8ECF4)),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(width: 1, color: Color(0XFFE8ECF4)),
            ),
          ),
          style: TextStyle(
            color: widget.disabled ? Colors.grey : Colors.black,
            fontSize: 16,
          ),
        ),
        if (widget.error != null)
          Container(
            margin: const EdgeInsets.only(top: 5),
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 8,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFFA8C8C).withOpacity(0.15),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.warning,
                  // Ionicons.warning_outline,
                  color: Color(0xFFF24F3A),
                  size: 16,
                ),
                const SizedBox(width: 6),
                Text(
                  widget.error!,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFFF24F3A),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
