import 'package:country_code_picker/country_code_picker.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:smart_select/smart_select.dart';
import 'package:wounono_covid/utils/constants.dart';
import 'package:wounono_covid/utils/helper.dart';
import 'package:wounono_covid/widgets/app_bar/in_page_app_bar.dart';
import 'package:country_list_pick/country_list_pick.dart';




class UserInformations extends StatefulWidget {
  @override
  _UserInformationsState createState() => _UserInformationsState();
}

class _UserInformationsState extends State<UserInformations> {

  int value = 0;
  List<S2Choice<int>> options = [
    S2Choice<int>(value: 0, title: 'Selectionner un genre', disabled: true),
    S2Choice<int>(value: 1, title: 'Homme'),
    S2Choice<int>(value: 2 , title: 'Femme')
  ];

  final format = DateFormat("dd-MM-yyyy");
  final myController = TextEditingController();



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
                                  contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                  hoverColor: Constants.primaryColor,
                                  border: OutlineInputBorder(),
                                  hintText: 'Entrer votre nom ici',
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
                                  hintText: 'Enter votre prenom ici',
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
                                lastDate: DateTime.now(),
                                builder: (context, child) => Localizations.override(
                                  context: context,
                                  locale: Locale('fr'),
                                  child: child,
                                ),
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
                                  nextScreen(context, "/nationalite");
                                },
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.arrow_drop_down_circle_outlined,
                                    color: Colors.black,
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


                ],
              ),
            )
          )
        ],
      )
    );
  }
}
