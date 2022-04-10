import 'package:flutter/material.dart';

import '../../../models/vocabulary_model.dart';
import '../../../network/api_service.dart';
import '../../colors/colors.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/validators.dart';
import '../dashboard/sub_vocabulary/word_widget.dart';

class SearchForm extends StatefulWidget {
  const SearchForm({Key? key}) : super(key: key);

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final _searchFormKey = GlobalKey<FormState>();
  final _searchController = TextEditingController();

  String? searchInput;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
       decoration: BoxDecoration(
            color: CustomColors.WHITE,
            borderRadius: BorderRadius.circular(5),
            boxShadow: const [
              BoxShadow(
                blurRadius: 2,
                offset: Offset(2, 2),
              ),
            ],
          ),
      child: Form(
        key: _searchFormKey,
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          controller: _searchController,
          
          decoration: InputDecoration(
            filled: true,
            fillColor: CustomColors.L_RED,
            
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(25),
            //   borderSide: BorderSide(),
            // ),
            labelText: 'Search Vocalubory',
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {});
              },
              icon: Icon(
                Icons.close,
              ),
            ),
          ),
          onChanged: (data) {
            searchInput = data;
            print(searchInput);
          },
        ),
      ),
    );
  }
}
