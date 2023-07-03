import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

class DropDownFormBuilder extends StatefulWidget {
  const DropDownFormBuilder({
    super.key,
    this.label = '',
    required this.fieldBloc,
  });

  final String label;
  final SelectFieldBloc<String> fieldBloc;

  @override
  State<DropDownFormBuilder> createState() => _DropDownFormBuilderState();
}

class _DropDownFormBuilderState extends State<DropDownFormBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectFieldBloc<String>, SelectFieldBlocState<String>>(
      bloc: widget.fieldBloc,
      builder: (context, state) {
        return DropdownButton<String?>(
          value: state.value,
          hint: Text(widget.label),
          items: state.options.map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                ),
              );
            },
          ).toList(),
          onChanged: (value) => widget.fieldBloc.value = value,
        );
      },
    );
  }
}
