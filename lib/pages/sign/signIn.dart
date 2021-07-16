import 'package:country_picker/country_picker.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:smart_select/smart_select.dart';
import 'package:wounono_covid/utils/constants.dart';
import 'package:wounono_covid/utils/helper.dart';
import 'package:intl/intl.dart';


class SignIn extends StatefulWidget {

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  int value = 0;
  List<S2Choice<int>> options = [
    S2Choice<int>(value: 0, title: 'Selectionner un genre', disabled: true),
    S2Choice<int>(value: 1, title: 'Homme'),
    S2Choice<int>(value: 2 , title: 'Femme')
  ];

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  final format = DateFormat("dd-MM-yyyy");
  final myController = TextEditingController();

  FocusNode myFocusNode = new FocusNode();

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'KM';
  PhoneNumber number = PhoneNumber(isoCode: 'KM');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: SafeArea(
        bottom: false,
        child: Container(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                right: 0.0,
                top: -20.0,
                child: Opacity(
                  opacity: 0.3,
                  child: Image.asset(
                    "assets/images/virus.png",
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 15.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Icon(
                                FlutterIcons.keyboard_backspace_mdi,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "S'inscrire",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  .copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Flexible(
                        child: Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            minHeight:
                            MediaQuery.of(context).size.height - 180.0,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                            ),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(24.0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Nom : ',
                                        ),
                                        SizedBox(
                                          height: ScreenUtil().setHeight(5.0),
                                        ),
                                        Container(
                                            child: TextField(
                                              decoration: InputDecoration(
                                                fillColor: Constants.scaffoldBackgroundColor,
                                                filled: true,
                                                suffixIcon: Icon(
                                                  FlutterIcons.user_ant,
                                                  color: Colors.grey,
                                                ),
                                                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                                hoverColor: Constants.primaryColor,
                                                border: OutlineInputBorder(),
                                                hintText: 'Entrer votre nom',
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                              ),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  .copyWith(
                                                color: Colors.black,
                                              ),
                                              cursorColor: Colors.black,
                                            )
                                        )
                                      ],
                                    )
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.02,
                                ),
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Prenoms : ',
                                        ),
                                        SizedBox(
                                          height: ScreenUtil().setHeight(5.0),
                                        ),
                                        Container(
                                            child: TextField(
                                              decoration: InputDecoration(
                                                fillColor: Constants.scaffoldBackgroundColor,
                                                filled: true,
                                                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                                hoverColor: Constants.primaryColor,
                                                border: OutlineInputBorder(),
                                                suffixIcon: Icon(
                                                  FlutterIcons.user_ant,
                                                  color: Colors.grey,

                                                ),
                                                hintText: 'Entrer votre prenom',
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                              ),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  .copyWith(
                                                color: Colors.black,
                                              ),
                                              cursorColor: Colors.black,
                                            )
                                        )
                                      ],
                                    )
                                ),


                                SmartSelect<int>.single(
                                    title: 'Genre ',
                                    tileBuilder: (context, state) {
                                      return S2Tile.fromState(
                                        state,
                                        padding:  EdgeInsets.symmetric(
                                            horizontal: 12.0,
                                            vertical: 2.0
                                        ),
                                        title: Text( 'Genre',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                              color: Colors.black,
                                            )
                                        ),
                                      );
                                    },
                                    choiceStyle: S2ChoiceStyle(
                                        color: Constants.primaryColor,
                                        activeColor: Constants.primaryColor
                                    ),
                                    choiceConfig: S2ChoiceConfig(
                                        useDivider: true
                                    ),
                                    modalConfig: S2ModalConfig(
                                        headerStyle: S2ModalHeaderStyle(
                                          textStyle: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: ScreenUtil().setSp(18)
                                          ),
                                        )
                                    ),
                                    value: value,
                                    choiceItems: options,
                                    onChange: (state) => setState(() => value = state.value)
                                ),

                                Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.0,
                                    ),
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            'Date de naissance : ',
                                          ),
                                          SizedBox(
                                            height: ScreenUtil().setHeight(5.0),
                                          ),
                                          DateTimeField(
                                            decoration: InputDecoration(
                                              fillColor: Constants.scaffoldBackgroundColor,
                                              filled: true,
                                              suffixIcon: Icon(
                                                FlutterIcons.calendar_ant,
                                                color: Colors.grey,
                                              ),
                                              contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                              hoverColor: Constants.primaryColor,
                                              border: OutlineInputBorder(),
                                              hintText: 'Selectionner votre date de naissance',
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                ),
                                              ),
                                            ),
                                            format: format,
                                            onShowPicker: (context, currentValue) {
                                              return showDatePicker(
                                                context: context,
                                                firstDate: DateTime(1900),
                                                initialDate: currentValue ?? DateTime.now(),
                                                locale : const Locale("fr","FR"),
                                                lastDate: DateTime.now(),
                                                builder: (BuildContext context, Widget child) {
                                                  return Theme(
                                                    data: ThemeData.light().copyWith(
                                                      colorScheme: ColorScheme.light(
                                                        primary: Constants.primaryColor,
                                                        onPrimary: Colors.white,
                                                        surface: Constants.primaryColor,
                                                        onSurface: Colors.black,
                                                      ),
                                                      dialogBackgroundColor:Colors.white,
                                                    ),
                                                    child: child,
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ])
                                ),


                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.02,
                                ),

                                Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Nationalité : ',
                                        ),
                                        SizedBox(
                                          height: ScreenUtil().setHeight(5.0),
                                        ),
                                        Container(
                                            child: TextField(
                                                onTap: (){
                                                  // _navigateAndDisplaySelection(context);
                                                  showCountryPicker(
                                                    context: context,
                                                    showPhoneCode: true, // optional. Shows phone code before the country name.
                                                    onSelect: (Country country) {
                                                      print('Select country: ${country}');
                                                    },
                                                    countryListTheme: CountryListThemeData(
                                                      // Optional. Sets the border radius for the bottomsheet.
                                                      borderRadius: BorderRadius.only(
                                                        topLeft: Radius.circular(40.0),
                                                        topRight: Radius.circular(40.0),
                                                      ),
                                                      // Optional. Styles the search field.
                                                      inputDecoration: InputDecoration(
                                                        labelText: 'Rechercher',
                                                        labelStyle: TextStyle(
                                                            color: myFocusNode.hasFocus ? Colors.blue : Colors.black
                                                        ),
                                                        focusColor: Colors.red,
                                                        fillColor: Colors.white,
                                                        prefixIcon: const Icon(
                                                          Icons.search,
                                                          color: Color(0xff3d8e33),
                                                        ),
                                                        focusedBorder:OutlineInputBorder(
                                                          borderSide: const BorderSide(color: Colors.white, width: 2.0),
                                                          borderRadius: BorderRadius.circular(25.0),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                decoration: InputDecoration(
                                                  suffixIcon: Icon(
                                                    Icons.arrow_drop_down_circle_outlined,
                                                    color: Colors.black,
                                                  ),
                                                  prefixIcon: Icon(
                                                    FlutterIcons.flag_ant,
                                                    color: Colors.grey,
                                                  ),
                                                  fillColor: Constants.scaffoldBackgroundColor,
                                                  filled: true,
                                                  contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                                  hoverColor: Constants.primaryColor,
                                                  border: OutlineInputBorder(),
                                                  hintText: 'Choisir votre nationalité',
                                                  enabledBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                    ),
                                                  ),
                                                  focusedBorder: OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                    ),
                                                  ),
                                                ),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText1
                                                    .copyWith(
                                                  color: Colors.black,
                                                ),
                                                focusNode: FocusNode(),
                                                enableInteractiveSelection: false,
                                                showCursor: false,
                                                readOnly: true
                                            )
                                        )
                                      ],
                                    )
                                ),

                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.02,
                                ),
                                Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Numero de piece d'identité : ",
                                        ),
                                        SizedBox(
                                          height: ScreenUtil().setHeight(5.0),
                                        ),
                                        Container(
                                            child: TextField(
                                              decoration: InputDecoration(
                                                fillColor: Constants.scaffoldBackgroundColor,
                                                filled: true,
                                                suffixIcon: Icon(
                                                  Icons.assignment_ind_outlined,
                                                  color: Colors.grey,
                                                ),
                                                hintText: 'Numéro de pièce',
                                                contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                                hoverColor: Constants.primaryColor,
                                                border: OutlineInputBorder(),
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                ),
                                              ),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1
                                                  .copyWith(
                                                color: Colors.black,
                                              ),
                                              cursorColor: Colors.black,
                                            )
                                        )
                                      ],
                                    )
                                ),


                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.02,
                                ),


                                Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Numero de téléphone : ",
                                        ),
                                        SizedBox(
                                          height: ScreenUtil().setHeight(5.0),
                                        ),
                                        InternationalPhoneNumberInput(
                                          onInputChanged: (PhoneNumber number) {
                                            print(number.phoneNumber);
                                          },
                                          onInputValidated: (bool value) {
                                            print(value);
                                          },
                                          selectorConfig: SelectorConfig(
                                            selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                                          ),
                                          errorMessage: "Numéro de téléphone invalide",
                                          ignoreBlank: false,
                                          autoValidateMode: AutovalidateMode.disabled,
                                          selectorTextStyle: TextStyle(color: Colors.black),
                                          initialValue: number,
                                          textFieldController: controller,
                                          formatInput: true,
                                          locale: 'fr-FR',
                                          inputDecoration: InputDecoration(
                                            fillColor: Constants.scaffoldBackgroundColor,
                                            filled: true,
                                            suffixIcon: Icon(
                                              FlutterIcons.phone_ant,
                                              color: Colors.grey,
                                            ),
                                            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                            hoverColor: Constants.primaryColor,
                                            border: OutlineInputBorder(),
                                            hintText: 'Numéro de telephone',
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                          ),
                                          keyboardType:
                                          TextInputType.numberWithOptions(signed: true, decimal: true),
                                          inputBorder: OutlineInputBorder(),
                                          onSaved: (PhoneNumber number) {
                                            print('On Saved: $number');
                                          },
                                        ),
                                      ],
                                    )
                                ),

                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.02,
                                ),


                                SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.02,
                                ),

                                Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 12.0,
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          child: Container(
                                            width: double.infinity,
                                            height: ScreenUtil().setHeight(48.0),
                                            decoration: BoxDecoration(
                                              color: Constants.primaryColor,
                                              borderRadius: BorderRadius.circular(8.0),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color.fromRGBO(169, 176, 185, 0.42),
                                                  spreadRadius: 0,
                                                  blurRadius: 8.0,
                                                  offset: Offset(0, 2),
                                                )
                                              ],
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Valider",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                ),
                              ],
                            ),
                          )
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}