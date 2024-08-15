import 'package:commercialcomputing/about_page.dart';
import 'package:commercialcomputing/donors/donors_payment_method_page.dart';
import 'package:flutter/material.dart';
import 'intro_page.dart';
import 'registration_selection_page.dart';
import 'user_selectiom_page.dart';
import 'donors/sign_in_page.dart' as donor;
import 'donors/forgot_password_email_page.dart';
import 'donors/forgot_password_credentials_page.dart';
import 'donors/forgot_password_sucess_page.dart';
import 'donors/donor_registration_page.dart';
import 'donors/sign_up_sucess_page.dart';
import 'donors/donor_home_page.dart';
import 'donors/donor_request_list.dart';
import 'donors/donor_request_view_page.dart';
import 'elderlyhome/sign_in_page.dart' as elderlyhome;
import 'elderlyhome/home_registration_page.dart';
import 'elderlyhome/home_home_page.dart';
import 'elderlyhome/home_request_selection_page.dart';
import 'elderlyhome/home_item_donation_request_page.dart';
import 'elderlyhome/home_request_money_donation_page.dart';
import 'elderlyhome/home_calendar_page.dart';
import 'elderlyhome/home_user_activity_page.dart';
import 'donors/donor_calendar_page.dart';
import 'base_scaffold.dart';
import 'donors/donor_profile_page.dart';
import 'donors/donor_money_request_page.dart';
import 'donors/donor_request_details_page.dart';
import 'elderlyhome/home_moneydonation_page.dart';
import 'help_page.dart';
import 'elderlyhome/home_profile_page.dart';
import 'elderlyhome/request_response_page.dart';
import 'elderlyhome/home_response_page.dart';
import 'donors/collaboration_page.dart';
import 'donors/donor_browse_elderlyhomes_page.dart';
import 'elderlyhome/home_services_donation_page.dart';
import 'donors/donor_service_response_page.dart';
import 'donors/donor_request_response_page.dart';
import 'donors/donor_service_request_form_page.dart';
import 'elderlyhome/service_request_response_page.dart';
import 'elderlyhome/time_slots_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bridge of Hope',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        fontFamily: 'Roboto', // Set the default font family to Roboto
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => IntroPage(),
        '/signIn': (context) => donor.SignInPage(),
        '/register': (context) => RegistrationSelectionPage(),
        '/lgoin': (context) => LoginSelectionPage(),
        'forgotpassword': (context) => ForgotPasswordEmailPage(),
        '/resetPassword': (context) {
          final args = ModalRoute
              .of(context)!
              .settings
              .arguments as Map<String, dynamic>;
          final token = args['token'] as String;
          return ResetPasswordPage(token: token);
        },
        '/forgotPasswordSuccess': (context) => ForgotPasswordSuccessPage(),
        '/registerdonor': (context) => DonorRegistrationPage(),
        '/signUpSuccess': (context) => SignUpSuccessPage(),
        '/donorsHomePage': (context) => DonorHomePage(),
        '/donorcalendar': (context) => BookingPage(),
        '/donorprofile': (context) => UserProfilePage(),
        '/homeprofile': (context) => HomeUserProfilePage(),
        '/requestList': (context) => RequestListPage(),
        '/requestview': (context) =>
        (ModalRoute
            .of(context)!
            .settings
            .arguments != null)
            ? RequestViewPage(requestId: ModalRoute
            .of(context)!
            .settings
            .arguments as String)
            : RequestListPage(),
        '/elderlyHomeSignIn': (context) => elderlyhome.SignInPage(),
        '/registerElderlyHome': (context) => ElderlyHomeRegistrationPage(),
        '/elderlyHomeHomePage': (context) => ElderlyHomeHomePage(),
        '/elderlyHomeRequestSelection': (context) =>
            ElderlyHomeRequestSelectionPage(),
        '/itemDonation': (context) => HomeItemDonationRequestPage(),
        '/moneyDonation': (context) => HomeRequestMoneyDonationPage(),
        '/donormoney': (context) => MoneyRequestsPage(),
        '/homemoneydonation': (context) => DonationAndPaymentPage(),
        '/donorpayment': (context) =>
            PaymentMethodPage(
              request: ModalRoute
                  .of(context)!
                  .settings
                  .arguments as Map<String, dynamic>,
            ),
        '/donormoneyview': (context) {
          final request = ModalRoute
              .of(context)!
              .settings
              .arguments as Map<String, dynamic>;
          return RequestDetailsPage(request: request);
        },
        '/homecalendar': (context) => CalendarPage(),
        '/homemanagement': (context) {
          final elderlyHomeId = ModalRoute
              .of(context)!
              .settings
              .arguments as int?;
          if (elderlyHomeId == null) {
            return Scaffold(
                body: Center(child: Text('Elderly home ID is missing')));
          }
          return BookingManagementPage(elderlyHomeId: elderlyHomeId);
        },
        '/request-response': (context) =>
            RequestResponsePage(
              donorDetails: ModalRoute
                  .of(context)!
                  .settings
                  .arguments as Map<String, dynamic>,
            ),
        '/homeresponse': (context) => HomeResponsePage(),
        'donorresponseselection': (context) => DonorRequestResponsePage(),
        '/donorserviceresponse': (context) => DonorServiceResponsePage(),
        '/helppage': (context) => HelpPage(),
        'aboutpage': (context) => AboutPage(),
        '/homecalendarresponse': (context) => TimeSlotsPage(),
        '/donorrequest': (context) => DonorRequestForm(),
        '/homeserviceresponse': (context) => ServiceRequestsPage(),
        '/homesservice': (context) => ServiceRequestPage(),
        '/browsehomes': (context) => DonorBrowseElderlyHomesPage(),
        '/collaborationdonors': (context) {
          final collaborationRoomId = ModalRoute.of(context)!.settings.arguments as String;
          return CollaborationPage(collaborationRoomId: collaborationRoomId);
        },
      },
    );
  }
}
