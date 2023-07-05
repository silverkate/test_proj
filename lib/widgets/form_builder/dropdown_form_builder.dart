import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stx_flutter_form_bloc/stx_flutter_form_bloc.dart';

class DropDownFormBuilder extends StatelessWidget {
  const DropDownFormBuilder({
    super.key,
    this.label = '',
    required this.fieldBloc,
  });

  final String label;
  final SelectFieldBloc<String> fieldBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectFieldBloc<String>, SelectFieldBlocState<String>>(
      bloc: fieldBloc,
      builder: (context, state) {
        return DropdownButton<String?>(
          value: state.value,
          hint: Text(label),
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
          onChanged: (value) => fieldBloc.value = value,
        );
      },
    );
  }
}
