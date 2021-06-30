import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:wounono_covid/models/healthStatus.dart';
import 'package:wounono_covid/utils/constants.dart';

class UserHealthStatus extends StatelessWidget {

  final DateFormat formatter = DateFormat("dd-MM-yyyy");
  
   @override
   Widget build(BuildContext context) {

     List<HealthStatus> healthStatus = [
       HealthStatus(
           testDate: DateTime(0,0,0),
           testSatuts: TestResult.TEST_NULL
       ),
       HealthStatus(
           testDate: DateTime(2021,06,21),
           testSatuts: TestResult.TEST_NEG
       ),
       HealthStatus(
           testDate: DateTime(2021,06,14),
           testSatuts: TestResult.TEST_POS
       )
     ];



     return Container(
       height: ScreenUtil().setHeight(170.0),
       child: ListView.separated(
           physics: BouncingScrollPhysics(),
           padding: EdgeInsets.symmetric(horizontal: 5.0),
           scrollDirection: Axis.horizontal,
           itemBuilder:(BuildContext context, int index ) {
             return GestureDetector(
                 onTap: (){
                   final snackBar = SnackBar(content: Text('Tap'));
                   ScaffoldMessenger.of(context).showSnackBar(snackBar);
                 },
                 child:
                 Column(
                   children: [
                     SizedBox(
                       height: ScreenUtil().setHeight(20.0),
                     ),
                     Container(
                       width: MediaQuery.of(context).size.width * 0.90,
                       decoration: BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.circular(8.0),
                       ),
                       padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 14.0),
                       child: Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Container(
                             width: ScreenUtil().setWidth(100.0),
                             height: ScreenUtil().setHeight(100.0),
                             child: Image.asset(
                                 _getQrImage(healthStatus[index].testSatuts)
                             ),
                           ),
                           SizedBox(
                             width: ScreenUtil().setWidth(10.0),
                           ),
                           Expanded(
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Wrap(
                                   children: [
                                     Text(
                                       "Date du test :",
                                       style: Theme.of(context)
                                           .textTheme
                                           .bodyText1
                                           .copyWith(
                                           color: Color.fromRGBO(74, 77, 84, 0.7),
                                       ),
                                     ),
                                     SizedBox(
                                       width: 4.0,
                                     ),
                                     Text(
                                       healthStatus[index].testDate == null  ? "--" : formatter.format(healthStatus[index].testDate),
                                       style: Theme.of(context)
                                           .textTheme
                                           .bodyText1
                                           .copyWith(
                                         color: Color.fromRGBO(19, 22, 33, 1),
                                       ),
                                     ),
                                   ],
                                 ),
                                 SizedBox(
                                   height: 5.0,
                                 ),
                                 Wrap(
                                   children: [
                                     Text(
                                       "Resultat du test :",
                                       style: Theme.of(context)
                                           .textTheme
                                           .bodyText1
                                           .copyWith(
                                         color: Color.fromRGBO(74, 77, 84, 0.7),
                                       ),
                                     ),
                                     SizedBox(
                                       width: 4.0,
                                     ),
                                     Text(
                                       _getResultString(healthStatus[index].testSatuts),
                                       style: Theme.of(context)
                                           .textTheme
                                           .bodyText1
                                           .copyWith(
                                         color: _getResultColor(healthStatus[index].testSatuts),
                                         fontWeight: FontWeight.bold
                                       ),
                                     ),
                                   ],
                                 ),
                               ],
                             ),
                           ),
                         ],
                       ),
                     ),
                   ],
                 )
             );
           },
           separatorBuilder: (BuildContext context, int index) {
             return SizedBox(
               width: 15.0,
             );
           },
           itemCount: healthStatus.length),
     );



   }

   String _getQrImage(TestResult status) {
     switch (status){
       case TestResult.TEST_NEG:
         return 'assets/images/qr_code_green.png';
       case TestResult.TEST_POS:
         return 'assets/images/qr_code_red.png';
       default:
         return 'assets/images/qr_code_gray.png';
     }
   }

   _getResultColor(TestResult status) {
     switch (status){
       case TestResult.TEST_NEG:
         return Constants.primaryColor;
       case TestResult.TEST_POS:
         return Colors.red;
       default:
         return Colors.black;
     }
   }

   String _getResultString(TestResult status) {
     switch (status){
       case TestResult.TEST_NEG:
         return 'Négatif';
       case TestResult.TEST_POS:
         return 'Positif';
       default:
         return '---';
     }
   }
 }




