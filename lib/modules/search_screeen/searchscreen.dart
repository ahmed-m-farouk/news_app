import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/component/conponents/conponents.dart';
import 'package:news_app/shared/cupite/cubit.dart';
import 'package:news_app/shared/cupite/state.dart';

class Searchscreen extends StatelessWidget {
  const Searchscreen({super.key});
  @override
  Widget build(BuildContext context) {
    var searchcController = TextEditingController();

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var List = AppCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                defaoultTextFromFiled(
                  valitator: (value) {
                    if (value!.isEmpty) {
                      return ('Search Must be Can not Emty');
                    }
                    return null;
                  },
                  prefixicon: Icons.search,
                  control: searchcController,
                  onchange: (value) {
                    AppCubit.get(context).getSearch(value);
                  },
                  type: TextInputType.text,
                  lable: 'search',
                ),
                Expanded(child: articalBuliderList(List, isSearch: true)),
              ],
            ),
          ),
        );
      },
    );
  }
}
