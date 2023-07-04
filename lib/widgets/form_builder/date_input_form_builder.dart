import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';
import 'package:test_proj/styles/index.dart';

class DateInputFormBuilder extends StatefulWidget {
  const DateInputFormBuilder({
    super.key,
    required this.fieldBloc,
  });

  final DateTimeFieldBloc fieldBloc;

  @override
  State<DateInputFormBuilder> createState() => _DateInputFormBuilderState();
}

class _DateInputFormBuilderState extends State<DateInputFormBuilder> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller =
        TextEditingController(text: widget.fieldBloc.value?.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DateTimeFieldBloc, DateTimeFieldBlocState>(
      bloc: widget.fieldBloc,
      builder: (context, state) {
        return TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Date',
            errorText: state.displayError,
            helperText: '',
            helperMaxLines: 1,
            errorMaxLines: 1,
            helperStyle: AppTextStyles.error,
            errorStyle: AppTextStyles.error,
          ),
          readOnly: true,
          onTap: _showDatePicker,
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _showDatePicker() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    _controller.text = pickedDate.toString();
    widget.fieldBloc.value = pickedDate;
  }
}
