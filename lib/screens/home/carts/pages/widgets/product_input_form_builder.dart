import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';
import 'package:test_proj/styles/index.dart';

class ProductInputFormBuilder extends StatefulWidget {
  const ProductInputFormBuilder({
    super.key,
    this.fieldFocusNode,
    this.nextFieldFocusNode,
    this.onSubmit,
    required this.fieldBloc,
  });

  final FocusNode? fieldFocusNode;
  final FocusNode? nextFieldFocusNode;
  final VoidCallback? onSubmit;
  final TextFieldBloc fieldBloc;

  @override
  State<ProductInputFormBuilder> createState() =>
      _ProductInputFormBuilderState();
}

class _ProductInputFormBuilderState extends State<ProductInputFormBuilder> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.fieldBloc.value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextFieldBloc, TextFieldBlocState>(
      bloc: widget.fieldBloc,
      builder: (context, state) {
        if (_controller.text != state.value) {
          final previousSelection = _controller.selection;

          final offset =
              min(previousSelection.baseOffset, state.toString().length);

          _controller
            ..text = state.toString()
            ..selection = previousSelection.copyWith(
              baseOffset: offset,
              extentOffset: offset,
            );
        }
        return Focus(
          onFocusChange: (value) {
            if (!value) {
              widget.fieldBloc.focusChanged();
            }
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: TextField(
                  controller: _controller,
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  focusNode: widget.fieldFocusNode,
                  onChanged: (value) => widget.fieldBloc.changeValue(value),
                  onSubmitted: (value) {
                    widget.nextFieldFocusNode?.requestFocus();
                    widget.onSubmit?.call();
                  },
                  decoration: InputDecoration(
                    errorText: state.displayError,
                    helperText: '',
                    helperMaxLines: 1,
                    errorMaxLines: 1,
                    helperStyle: AppTextStyles.error,
                    errorStyle: AppTextStyles.error,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TextField(
                  controller: _controller,
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  focusNode: widget.fieldFocusNode,
                  onChanged: (value) => widget.fieldBloc.changeValue(value),
                  onSubmitted: (value) {
                    widget.nextFieldFocusNode?.requestFocus();
                    widget.onSubmit?.call();
                  },
                  decoration: InputDecoration(
                    errorText: state.displayError,
                    helperText: '',
                    helperMaxLines: 1,
                    errorMaxLines: 1,
                    helperStyle: AppTextStyles.error,
                    errorStyle: AppTextStyles.error,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}