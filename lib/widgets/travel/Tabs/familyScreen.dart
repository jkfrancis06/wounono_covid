import 'package:flutter/material.dart';
import 'package:wounono_covid/widgets/travel/Tabs/dialog/parentInfoDialog.dart';


class FamiyScreen extends StatefulWidget {

  @override
  _FamiyScreenState createState() => _FamiyScreenState();
}

class _FamiyScreenState extends State<FamiyScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        clipBehavior: Clip.none,
        children: [
        SingleChildScrollView(
           child: Column(
             children: [
               SizedBox(
                 height: MediaQuery.of(context).size.height*0.06,
               ),
               Center(
                 child: Column(
                   children: [
                     OutlinedButton(
                       onPressed: () {
                         _openAddEntryDialog();
                       },
                       child: const Text(
                         "Ajouter les membres de la famille",
                         style: TextStyle(
                             color: Colors.black
                         ),
                       ),
                       style: ButtonStyle(
                         shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                         overlayColor: MaterialStateProperty.resolveWith<Color>(
                               (Set<MaterialState> states) {
                             if (states.contains(MaterialState.pressed))
                               return Theme.of(context).colorScheme.secondary.withOpacity(0.5);
                             return null;
                           },
                         ),
                       ),
                     ),
                     SizedBox(
                       height: MediaQuery.of(context).size.height*0.02,
                     ),

                     Padding(
                         padding: EdgeInsets.symmetric(
                           horizontal: 12.0,
                         ),
                         child:  Container(
                           child: Text(
                               "Entrer les informations de toute personne voyangeant avec vous agé de moins de 12 ans ou plus de 60 ans",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                             ),
                           ),
                         )
                     ),


                   ],
                 )
               )
             ],
           ),
        )]
    );
  }

  Future _openAddEntryDialog() async {

    final result = await Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context){
          return new ParentInfoDialog();
        },
        fullscreenDialog: true
      )
    );
  }

}
