import 'package:country_picker/country_picker.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smart_select/smart_select.dart';
import 'package:wounono_covid/utils/constants.dart';
import 'package:wounono_covid/widgets/app_bar/in_page_app_bar.dart';




class UserInformationsScreen extends StatefulWidget {
  @override
  _UserInformationsState createState() => _UserInformationsState();
}

class _UserInformationsState extends State<UserInformationsScreen> {

  int value = 0;
  List<S2Choice<int>> options = [
    S2Choice<int>(value: 0, title: 'Selectionner un genre', disabled: true),
    S2Choice<int>(value: 1, title: 'Homme'),
    S2Choice<int>(value: 2 , title: 'Femme')
  ];

  final format = DateFormat("dd-MM-yyyy");
  final myController = TextEditingController();

  FocusNode myFocusNode = new FocusNode();



  @override
  initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.scaffoldBackgroundColor,
      appBar: in_page_app_bar(context, 'Mettre a jour mon profil'),
      body:
      Stack(
        clipBehavior: Clip.none,
        children: [
          SingleChildScrollView(
            child: Form(
              child: Column(
                children: [
                  SizedBox(
                    height: kToolbarHeight / 4,
                  ),
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
                                  fillColor: Colors.white,
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
                                  fillColor: Colors.white,
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
                            fillColor: Colors.white,
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
                                  fillColor: Colors.white,
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
                                  fillColor: Colors.white,
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
                          Container(
                              child: TextField(
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  suffixIcon: Icon(
                                    Icons.phone,
                                    color: Colors.grey,
                                  ),
                                  hintText: "Numéro de telephone",
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
                            "Adresse email : ",
                          ),
                          SizedBox(
                            height: ScreenUtil().setHeight(5.0),
                          ),
                          Container(
                              child: TextField(
                                decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  filled: true,
                                  suffixIcon: Icon(
                                    Icons.email_outlined,
                                    color: Colors.grey,
                                  ),
                                  hintText: 'Saisir votre adresse email',
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
                                  'Mettre a jour',
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

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                ],
              ),
            )
          )
        ],
      )
    );
  }

  void _navigateAndDisplaySelection(BuildContext context) async {
    // Navigator.push returns a Future that completes after calling
    // Navigator.pop on the Selection Screen.
    final result = await Navigator.of(context).pushNamed('/nationalite');

    print(result);

  }

}
