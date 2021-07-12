import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wounono_covid/utils/constants.dart';
import 'package:wounono_covid/widgets/app_bar/in_page_app_bar.dart';
import 'package:intl/intl.dart';


class TravelInfoForm extends StatefulWidget {

  @override
  _TravelInfoFormState createState() => _TravelInfoFormState();
}

class _TravelInfoFormState extends State<TravelInfoForm> {

  final format = DateFormat("dd-MM-yyyy");


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constants.scaffoldBackgroundColor,
        appBar: in_page_app_bar(context, 'Informations de vol'),
        body:  Stack(
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
                              'Numéro de vol : ',
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
                                    hintText: '',
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
                              'Numéro de siege : ',
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
                                    hintText: '',
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
                            children: <Widget>[
                              Text(
                                "Date d'arrivée:",
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
                                  hintText: '',
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
                                format:  format,
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
                              'Aéroport de depart : ',
                            ),
                            SizedBox(
                              height: ScreenUtil().setHeight(5.0),
                            ),
                            Container(
                                child: TextField(
                                    onTap: (){
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
                                      hintText: '',
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
                  ],
                ),
              )
            )
          ]
        )
    );
  }
}
