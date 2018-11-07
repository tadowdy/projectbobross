import 'package:flutter/material.dart';
import 'package:pbr/Auxiliary/uiComponents.dart';

class SurveyDetailsPage extends StatelessWidget {
  void _submitSurvey(/*Survey survey*/) {
    // TODO: submit survey responses using a DAO.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text('Tell us about yourself!')),
      body: Container(
        padding: const EdgeInsets.only(
            left: horizontalPadding, right: horizontalPadding, top: topPadding),
        child: new Center(
          child: new SingleChildScrollView(
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Container(
                    padding: const EdgeInsets.all(horizontalPadding),
                    child: new Column(children: <Widget>[
                      new Text("What is your age?", style: headingThreeBold),
                      new CheckboxListTile(
                          value: false,
                          onChanged: null,
                          title: new Text("0-19")),
                      new CheckboxListTile(
                          value: false,
                          onChanged: null,
                          title: new Text("20-39")),
                      new CheckboxListTile(
                          value: false,
                          onChanged: null,
                          title: new Text("40-59")),
                      new CheckboxListTile(
                          value: false,
                          onChanged: null,
                          title: new Text("60-79")),
                      new CheckboxListTile(
                          value: false,
                          onChanged: null,
                          title: new Text("80+")),
                    ]),
                  ),
                  new Container(
                    padding: const EdgeInsets.all(horizontalPadding),
                    child: new Column(children: <Widget>[
                      new Text("What ethnicity are you?",
                          style: headingThreeBold),
                      new CheckboxListTile(
                          value: false,
                          onChanged: null,
                          title: new Text("Caucasian")),
                      new CheckboxListTile(
                          value: false,
                          onChanged: null,
                          title: new Text("African-American")),
                      new CheckboxListTile(
                          value: false,
                          onChanged: null,
                          title: new Text("Native-American")),
                      new CheckboxListTile(
                          value: false,
                          onChanged: null,
                          title: new Text("Asian")),
                      new CheckboxListTile(
                          value: false,
                          onChanged: null,
                          title: new Text("Other (Please Specify)")),
                      new TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.grey,
                            border: new OutlineInputBorder()),
                      ),
                    ]),
                  ),
                  new Container(
                    padding: const EdgeInsets.all(5.0),
                    child: new Column(children: <Widget>[
                      new Text("What is your gender?", style: headingThreeBold),
                      new CheckboxListTile(
                          value: false,
                          onChanged: null,
                          title: new Text("Male")),
                      new CheckboxListTile(
                          value: false,
                          onChanged: null,
                          title: new Text("Female")),
                      new CheckboxListTile(
                          value: false,
                          onChanged: null,
                          title: new Text(
                            "Other (Please Specify)",
                            style: headingThreeBold,
                          )),
                      new TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.grey,
                            border: new OutlineInputBorder()),
                      ),
                    ]),
                  ),
                  ButtonTheme(
                    minWidth: medButtonWidth,
                    height: buttonHeight,
                    child: RaisedButton(
                      onPressed: () {},
                      child: new Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(right: horizontalPadding),
                            child: Text(
                              'Submit',
                              style: TextStyle(fontSize: buttonTextSize),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
