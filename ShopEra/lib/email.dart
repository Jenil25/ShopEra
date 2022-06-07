import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

void sendEmail(String user_email) async {
  var code = "1234";
  String user = 'shopera.shop@gmail.com'; //Your Email;
  String pass = 'dubaramatpuchhna'; //Your Email's password;

  final smtpServer = gmail(user, pass);
  // Creating the Gmail server
  // Create our email message.
  final message = Message()
    ..from = Address(user)
    ..recipients.add(user_email) //recipent email
    //..ccRecipients.addAll([]) //cc Recipents emails
    //..bccRecipients.add(Address()) //bcc Recipents emails
    ..subject =
        'Reset Password Request Received at ${DateTime.now()}' //subject of the email
    ..text =
        'We have received your reset password request.Your verification code is $code\nIf the request was not initiated by you, please ignore the email'; //body of the email

  try {
    final sendReport = await send(message, smtpServer);
    print(
        'Message sent: ' + sendReport.toString()); //print if the email is sent
  } on MailerException catch (e) {
    print(
        'Message not sent. \n' + e.toString()); //print if the email is not sent
    // e.toString() will show why the email is not sending
  }
}
