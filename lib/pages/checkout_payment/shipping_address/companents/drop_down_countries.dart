import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownCountries extends StatefulWidget {
  const DropDownCountries({super.key, required this.onValueSelected, required this.formKey});
  final Function(String?) onValueSelected;
  final GlobalKey<FormState> formKey;

  @override
  State<DropDownCountries> createState() => _DropDownCountriesState();
}

class _DropDownCountriesState extends State<DropDownCountries> {
  List<String> countries = [
    "Uzbekistan",
    "Russia",
    "Chili",
    "China",
    "Armenia",
    "Saudi Arabia",
    "Australia",
    "Scotland",
    "Africa",
    "Canada",
    "Japan",
    "Korea",
    "Azerbaijan",
    "Palestine",
    "Eran",
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: DropdownButtonFormField<String>(
        validator: (inp) {
          if (inp == null || inp.isEmpty) {
            return "Please Choose Country";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          border: InputBorder.none,
          label: Text("Country"),
          labelStyle: GoogleFonts.inter(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        items: [
          for(int i = 0 ; i < countries.length; i++)
            DropdownMenuItem( value: countries[i], child: Text(countries[i]))
        ],
        value: selectedValue,
        onChanged: (value) {
          widget.onValueSelected(value);
          widget.formKey.currentState!.validate();
          setState(() {
            selectedValue = value!;
          });
        },
      ),
    );
  }
}
