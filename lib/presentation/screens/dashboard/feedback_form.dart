import 'package:chinese_learning/presentation/widgets/custom_button.dart';
import 'package:chinese_learning/presentation/widgets/custom_textfield.dart';
import 'package:chinese_learning/presentation/widgets/custom_white_icon_button.dart';
import 'package:chinese_learning/presentation/widgets/custom_white_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/validators.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({Key? key}) : super(key: key);

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final _feedbackKey = GlobalKey<FormState>();
  final _subjectController = TextEditingController();
  final _feedbackController = TextEditingController();
  String? subjectInput;
  String? feedbackInput;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _feedbackKey,
      child: Column(children: [
        CustomWhiteTextField(
          fieldHint: "Enter your subject.",
          fieldLabel: "Subject",
          controller: _subjectController,
          save: (value) {
            print("HERE: $value");
            subjectInput = value;
            print("HERE: $subjectInput");
          },
          validation: (value) {
            return TextValidator.emailValidation(value);
          },
        ),
        CustomWhiteTextField(
          fieldHint: "Enter your feedback.",
          fieldLabel: "Feedback",
          controller: _feedbackController,
          save: (value) {
            print("HERE: $value");
            feedbackInput = value;
            print("HERE: $feedbackInput");
          },
          validation: (value) {
            return TextValidator.emailValidation(value);
          },
        ),
        CustomFormButton(
          buttonText: "Continue",
          save: () async {
            print("HERE:$subjectInput");
            if (_feedbackKey.currentState!.validate()) {
              _feedbackKey.currentState!.save();

              const toEmail = 'namastechina2022@gmail.com';
            final subject = "$subjectInput";
            final message =
                '$feedbackInput';
            final url = 'mailto: $toEmail?subject=$subject&body=$message';
            if (await canLaunch(url)) {
              await launch(
                url,
                forceSafariVC: false,
              );
            }
            }
            
          },
        )
      ]),
    );
  }
}
