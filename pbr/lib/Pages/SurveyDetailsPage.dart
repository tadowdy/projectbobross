import 'package:flutter/material.dart';

class SurveyDetailsPage extends StatelessWidget {

  void _submitSurvey(/*Survey survey*/) {
    // TODO: submit survey responses using a DAO.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title: new Text('Survey Details')
      ),
      body: Center(
        child: Text('Put the Survey Here..'),
      ),
    );
  }
}
