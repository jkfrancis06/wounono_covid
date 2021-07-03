import 'package:flutter/material.dart';
import 'package:wounono_covid/widgets/settings/confidentiality_policy_card.dart';
import 'package:wounono_covid/widgets/settings/helpdesk_card.dart';
import 'package:wounono_covid/widgets/settings/id_document_card.dart';
import 'package:wounono_covid/widgets/settings/language_card.dart';
import 'package:wounono_covid/widgets/settings/logout_card.dart';
import 'package:wounono_covid/widgets/settings/rating_card.dart';
import 'package:wounono_covid/widgets/settings/share_card.dart';
import 'package:wounono_covid/widgets/settings/user_settings_card.dart';

class Settings extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: kToolbarHeight / 4,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: LanguageCard(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: UserSettingsCard(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: IdDocumentCard(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: ConfidentialityPolicyCard(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: RatingCard(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: ShareCard(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: HelpDeskCard(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              child: LogoutCard(),
            ),
          ],
        ),
      ),
    );
  }
}
