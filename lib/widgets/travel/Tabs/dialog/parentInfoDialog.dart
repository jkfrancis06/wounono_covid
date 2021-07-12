import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_select/smart_select.dart';
import 'package:wounono_covid/utils/constants.dart';
import 'package:intl/intl.dart';


class ParentInfoDialog extends StatefulWidget {

  @override
  _ParentInfoDialogState createState() => _ParentInfoDialogState();
}

class _ParentInfoDialogState extends State<ParentInfoDialog> {

  int value = 0;
  List<S2Choice<int>> options = [
    S2Choice<int>(value: 0, title: 'Selectionner un genre', disabled: true),
    S2Choice<int>(value: 1, title: 'Homme'),
    S2Choice<int>(value: 2 , title: 'Femme')
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("Ajouter un membre de la famille"),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          SingleChildScrollView(
              child: Form(
                  child:
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
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
                                Container(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        fillColor: Constants.scaffoldBackgroundColor,
                                        filled: true,
                                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                        hoverColor: Constants.primaryColor,
                                        border: OutlineInputBorder(),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                        ),
                                        hintText: 'Nom  ',
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

                                Container(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        fillColor: Constants.scaffoldBackgroundColor,
                                        filled: true,
                                        hintText: 'Prenoms ',
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


                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),

                        Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  DateTimeField(
                                    decoration: InputDecoration(
                                      fillColor: Constants.scaffoldBackgroundColor,
                                      filled: true,
                                      suffixIcon: Icon(
                                        FlutterIcons.calendar_ant,
                                        color: Colors.grey,
                                      ),
                                      hintText: 'Date de naissance ',
                                      hintStyle: TextStyle(fontSize: 15.0),
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
                                    format: DateFormat("dd-MM-yyyy"),
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
                                Container(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        fillColor:  Constants.scaffoldBackgroundColor,
                                        filled: true,
                                        suffixIcon: Icon(
                                          Icons.assignment_ind_outlined,
                                          color: Colors.grey,
                                        ),
                                        hintText: "Numero de piece d'identité  ",
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
                                        'Valider',
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
          )
        ],
      )
    );
  }
}
