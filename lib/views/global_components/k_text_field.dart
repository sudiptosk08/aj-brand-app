import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ajapp/views/styles/b_style.dart';

// ignore: must_be_immutable
class KTextField extends StatefulWidget {
  final String? hintText;
  final String? labelText;
  final String? initialValue;
  final bool? requiredField;
  final Color? hintColor;
  final Icon? suffixIcon;
  final Widget? prefixIcon;
  final bool hasPrefixIcon;
  final bool isPasswordField;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final double widthFactor;
  final bool isReadOnly;
  final Function()? onTap;
  final int maxLines;
  final int minLines;
  final double topMargin;
  final double borderRadius;
  final bool isClearableField;
  final FormFieldValidator? validator;
  String? errorMessage;
  final Function(String value)? callBackFunction;
  final bool callBack;
  final Color? backgroundColor;
  final Color? textColor;
  final bool suffixCallback;
  final Function()? suffixCallbackFunction;
  final bool autofocus;
  final List<TextInputFormatter>? inputFormatters;
  // ignore: prefer_typing_uninitialized_variables
  final inputBorder;
  KTextField({
    Key? key,
    this.labelText,
    this.requiredField = true,
    this.hintText,
    this.initialValue,
    this.hintColor,
    this.suffixIcon,
    this.prefixIcon,
    this.hasPrefixIcon = false,
    this.isPasswordField = false,
    this.controller,
    this.widthFactor = 1,
    this.textInputType = TextInputType.text,
    this.isReadOnly = false,
    this.onTap,
    this.maxLines = 1,
    this.minLines = 1,
    this.topMargin = 8,
    this.borderRadius = 6.0,
    this.isClearableField = false,
    this.validator,
    this.errorMessage = "",
    this.callBack = false,
    this.callBackFunction,
    this.backgroundColor = KColor.greybg,
    this.textColor = KColor.black,
    this.suffixCallback = false,
    this.suffixCallbackFunction,
    this.autofocus = false,
    this.inputFormatters,
    this.inputBorder = const UnderlineInputBorder(),
  }) : super(key: key);
  @override
  _KTextFieldState createState() => _KTextFieldState();
}

class _KTextFieldState extends State<KTextField> {
  bool _isClearableText = false;
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          Row(
            children: [
              Text(widget.labelText ?? '',
                  textAlign: TextAlign.center,
                  style: KTextStyle.bodyText2.copyWith(
                    color: KColor.black.withOpacity(0.7),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )),
              if (widget.requiredField!)
                Text('*',
                    textAlign: TextAlign.center,
                    style: KTextStyle.bodyText2.copyWith(color: KColor.red)),
            ],
          ),
        Container(
          width: MediaQuery.of(context).size.width * widget.widthFactor,
          padding: widget.hasPrefixIcon
              ? const EdgeInsets.symmetric(horizontal: 4)
              : const EdgeInsets.only(right: 0),
          // padding: EdgeInsets.symmetric( vertical: 4),
          margin:
              EdgeInsets.only(top: KSize.getHeight(context, widget.topMargin)),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: KColor.white.withOpacity(0.1),
                  blurRadius: 2,
                  spreadRadius: 0,
                  offset: const Offset(0, 1)),
            ],
            border: Border.all(
              color: widget.errorMessage == null
                  ? KColor.grey
                  : widget.errorMessage!.isEmpty
                      ? KColor.grey
                      : KColor.red,
              width: 0.7,
              style: widget.errorMessage == null || widget.errorMessage!.isEmpty
                  ? BorderStyle.none
                  : BorderStyle.solid,
            ),
            borderRadius:
                BorderRadius.all(Radius.circular(widget.borderRadius)),
          ),
          child: TextFormField(
            validator: (String? value) {
              setState(() {
                widget.errorMessage = widget.validator!(value)!;
              });
              return widget.errorMessage!.isNotEmpty ? '' : null;
            },
            initialValue: widget.initialValue,
            inputFormatters: widget.inputFormatters ?? [],
            controller: widget.controller,
            readOnly: widget.isReadOnly,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            cursorColor: KColor.blue,
            keyboardType: widget.textInputType,
            style: KTextStyle.bodyText1
                .copyWith(color: widget.textColor ?? KColor.red),
            obscureText: widget.isPasswordField ? _obscureText : false,
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.start,
            autofocus: widget.autofocus,

            decoration: InputDecoration(
              isDense: true,
              hintText: widget.hintText,
              hintStyle: KTextStyle.bodyText2.copyWith(
                color: KColor.bodyText1,
                fontSize: 12,
              ),
              errorStyle: const TextStyle(fontSize: 0, height: 0),
              fillColor: Colors.white,
              enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: KColor.dividerClr),
              ),
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: KColor.dividerClr),
              ),
              prefixIcon: widget.hasPrefixIcon
                  ? Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: widget.prefixIcon)
                  : Container(width: 0),
              prefixIconConstraints:
                  BoxConstraints(minHeight: widget.hasPrefixIcon ? 21 : 0),
              suffixIcon: widget.isPasswordField
                  ? obscureText()
                  : widget.isClearableField
                      ? clearField()
                      : widget.suffixIcon != null
                          ? InkWell(
                              onTap: widget.suffixCallbackFunction,
                              child: widget.suffixIcon)
                          : null,
            ),
            onTap: widget.onTap,
            // onFieldSubmitted: (val){
            //   /// Search query
            //   if (widget.callBack) {
            //     widget.callBackFunction!(val);
            //   }
            // },
            onChanged: (val) {
              if (val != '') {
                if (!_isClearableText) {
                  setState(() {
                    _isClearableText = true;
                  });
                } else if (widget.errorMessage != null) {
                  setState(() {
                    widget.errorMessage = null;
                  });
                }
              } else {
                setState(() {
                  _isClearableText = false;
                });
              }

              /// Search query
              if (widget.callBack) {
                widget.callBackFunction!(val);
              }
            },
          ),
        ),
      ],
    );
  }

  GestureDetector obscureText() {
    return GestureDetector(
      onTap: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
      child: Icon(
        /// Based on password visibility state choose the icon
        _obscureText ? Icons.visibility : Icons.visibility_off,
        size: 18.0,
        color: KColor.textFieldLabel,
      ),
    );
  }

  GestureDetector clearField() {
    return GestureDetector(
      onTap: () {
        widget.controller!.clear();
        setState(() {
          _isClearableText = false;
        });
        if (widget.suffixCallback) {
          widget.suffixCallbackFunction!();
        }
      },
      child: Icon(
        Icons.cancel,
        color: _isClearableText ? KColor.black54 : KColor.transparent,
        size: 16.0,
      ),
    );
  }
}
