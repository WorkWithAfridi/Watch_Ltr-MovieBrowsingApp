import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/customColors.dart';
import '../../constants/customTextStyle.dart';
import '../../provider/search_provider.dart';

class CustomSearchField extends StatelessWidget {
  final TextEditingController textEditingController;
  final bool isPass;
  final String hintText;
  final TextInputType textInputType;

  const CustomSearchField(
      {Key? key,
      required this.textEditingController,
      this.isPass = false,
      required this.hintText,
      required this.textInputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderSide: Divider.createBorderSide(context),
    );
    return TextField(
      onSubmitted: (value){

        SearchProvider searchProvider =
        Provider.of<SearchProvider>(context,
            listen: false);
        searchProvider.showSearchResults = true;
        searchProvider.showLoading = true;

        searchProvider.getSearchResult(value);

        Future.delayed(Duration(seconds: 1))
            .then((value) {
          searchProvider.showLoading = false;
          print('done searching');
        });

        print(value);
      },
      style: defaultTS.copyWith(color: white, fontSize: 16),
      cursorColor: black,
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: defaultTS.copyWith(color: white, fontSize: 16),
        border: inputBorder,
        focusedBorder: inputBorder,
        enabledBorder: inputBorder,
        fillColor: red.withOpacity(.5),
        filled: true,
        contentPadding: EdgeInsets.all(8),
      ),
      keyboardType: textInputType,
      obscureText: isPass,
    );
  }
}
