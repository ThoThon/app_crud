import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class InputField extends StatefulWidget {
  final String label;
  final String hintText;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatter;
  final String? clearIconAsset;
  final bool showPassword;
  final String? Function(String?)? validator;

  const InputField({
    super.key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.inputFormatter,
    this.clearIconAsset,
    this.showPassword = false,
    this.validator,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool showSuffix = true;
  String inputText = '';
  String? errorMessage;

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

          TextFormField(
            controller: widget.controller,
            obscureText: widget.showPassword ? showSuffix : false,
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
              suffixIcon: widget.showPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          showSuffix = !showSuffix;
                        });
                      },
                      icon: SvgPicture.asset(
                        showSuffix
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
            validator: (value) {
              final result = widget.validator?.call(value);
              setState(() {
                errorMessage = result;
              });
              return null;
            },
          ),

          const SizedBox(height: 4),

          errorMessage != null && errorMessage!.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      errorMessage!,
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
