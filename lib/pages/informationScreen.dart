import 'package:flutter/material.dart';
import 'package:wounono_covid/widgets/information/faq_card.dart';
import 'package:wounono_covid/widgets/information/get_vaccine_card.dart';
import 'package:wounono_covid/widgets/information/guidline_card.dart';
import 'package:wounono_covid/widgets/information/press_update.dart';
import 'package:wounono_covid/widgets/information/sanitary_procedure_airport_card.dart';
import 'package:wounono_covid/widgets/information/stop_covid_card.dart';
import 'package:wounono_covid/widgets/information/symptoms_card.dart';

class InformationsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: kToolbarHeight / 4,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                  ),
                  child:SanitaryProcedureAirportCard()
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                  ),
                  child:GetVaccineCard()
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                  ),
                  child:PressUpdate()
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                  ),
                  child:SymptomsCard()
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                  ),
                  child:StopCovidCard()
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                  ),
                  child:GuidlineCard()
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                  ),
                  child:FaqCard()
              ),
            ],
          ),
        )
      ],
    );
  }
}
