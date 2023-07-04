import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';
import 'package:test_proj/models/cart/models.dart';
import 'package:test_proj/styles/index.dart';

class ProductInputFormBuilder extends StatefulWidget {
  const ProductInputFormBuilder({
    super.key,
    this.fieldFocusNode,
    this.nextFieldFocusNode,
    this.onSubmit,
    required this.fieldBloc,
    required this.index,
  });

  final FocusNode? fieldFocusNode;
  final FocusNode? nextFieldFocusNode;
  final VoidCallback? onSubmit;
  final ListFieldBloc<Product> fieldBloc;
  final int index;

  @override
  State<ProductInputFormBuilder> createState() =>
      _ProductInputFormBuilderState();
}

class _ProductInputFormBuilderState extends State<ProductInputFormBuilder> {
  late TextEditingController _productIdController;
  late TextEditingController _quantityController;

  @override
  void initState() {
    final product = widget.fieldBloc[widget.index];

    _productIdController =
        TextEditingController(text: product.productId.toString());
    _quantityController =
        TextEditingController(text: product.quantity.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListFieldBloc<Product>, ListFieldBlocState<Product>>(
      bloc: widget.fieldBloc,
      builder: (context, state) {
        final product = widget.fieldBloc[widget.index];

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
                  controller: _productIdController,
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  focusNode: widget.fieldFocusNode,
                  onChanged: (value) => widget.fieldBloc.replaceAt(
                    widget.index,
                    product.copyWith(
                      productId: int.tryParse(_productIdController.text) ?? 0,
                    ),
                  ),
                  onSubmitted: (value) {
                    widget.nextFieldFocusNode?.requestFocus();
                    widget.onSubmit?.call();
                  },
                  decoration: InputDecoration(
                    errorText: state.displayError,
                    hintText: 'Product id',
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
                  controller: _quantityController,
                  autocorrect: false,
                  textInputAction: TextInputAction.next,
                  focusNode: widget.fieldFocusNode,
                  onChanged: (value) => widget.fieldBloc.replaceAt(
                    widget.index,
                    product.copyWith(
                        quantity: int.tryParse(_quantityController.text) ?? 0),
                  ),
                  onSubmitted: (value) {
                    widget.nextFieldFocusNode?.requestFocus();
                    widget.onSubmit?.call();
                  },
                  decoration: InputDecoration(
                    errorText: state.displayError,
                    hintText: 'Quantity',
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
    _productIdController.dispose();
    _quantityController.dispose();
    super.dispose();
  }
}
