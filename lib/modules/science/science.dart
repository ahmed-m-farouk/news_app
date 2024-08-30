import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/component/conponents/conponents.dart';
import 'package:news_app/shared/cupite/cubit.dart';
import 'package:news_app/shared/cupite/state.dart';

class Science extends StatelessWidget {
  const Science({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var List = AppCubit.get(context).science;
        return articalBuliderList(List);
      },
    );
  }
}
