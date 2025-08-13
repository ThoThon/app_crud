import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatter;
  final String? clearIconAsset;
  final bool isPassword;

  const InputField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.errorText,
    this.inputFormatter,
    this.clearIconAsset,
    this.isPassword = false,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isObscure = true;
  String inputText = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Label
          Text(
            widget.label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),

          // TextField
          TextField(
            controller: widget.controller,
            obscureText: widget.isPassword ? isObscure : false,
            obscuringCharacter: '*',
            cursorColor: const Color(0xFFf24e1e),
            keyboardType:
                widget.inputFormatter != null ? TextInputType.number : null,
            inputFormatters: widget.inputFormatter,
            decoration: InputDecoration(
              hintText: widget.hintText,
              enabledBorder: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: Color(0xFFf24e1e), width: 2),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 16),

              // Suffix icon
              suffixIcon: widget.isPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          isObscure = !isObscure;
                        });
                      },
                      icon: SvgPicture.asset(
                        isObscure
                            ? 'assets/icons/eyeclose.svg'
                            : 'assets/icons/eyeopen.svg',
                        width: 24,
                        height: 24,
                      ),
                    )
                  : (inputText.isNotEmpty && widget.clearIconAsset != null)
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              widget.controller.clear();
                              inputText = '';
                            });
                          },
                          icon: SvgPicture.asset(
                            widget.clearIconAsset!,
                            width: 24,
                            height: 24,
                          ),
                        )
                      : null,
            ),
            onChanged: (value) {
              setState(() {
                inputText = value;
              });
            },
          ),

          const SizedBox(height: 4),

          // Error text custom
          widget.errorText != null && widget.errorText!.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      widget.errorText!,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xFFf24e1e),
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
