import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:porfolio/constants/colors.dart';
import 'package:porfolio/constants/const.dart';
import 'package:porfolio/constants/styles.dart';
import 'package:porfolio/widgets/app_section_container.dart';
import 'package:porfolio/widgets/gradient_text.dart';

class ContactMeSection extends StatefulWidget {
  final Size size;

  const ContactMeSection({
    super.key,
    required this.size,
  });

  @override
  State<ContactMeSection> createState() => _ContactMeSectionState();
}

class _ContactMeSectionState extends State<ContactMeSection> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  var firstNameTC = TextEditingController();
  var lastNameTC = TextEditingController();
  var emailTC = TextEditingController();
  var phoneTC = TextEditingController();
  var messageTC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppSectionContainer(
        backgroundColor: ebony,
        padding: EdgeInsets.symmetric(
          horizontal: width() > 600 ? width() * 0.06 : 16,
          vertical: 48,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(0.05),
            GradientTextWidget(
              size: widget.size,
              text1: "Let's work together!",
            ),
            Text(
              "What's next? Feel free to reach out to me if you're looking for a developer, or simply want to connect.",
              style: TextStyles.style16regular,
              textAlign: TextAlign.center,
            ),
            verticalSpaceMedium(),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 16,
              runSpacing: 12,
              children: [
                SvgPicture.asset(
                  "assets/icons/chat.svg",
                  colorFilter: const ColorFilter.mode(white, BlendMode.srcIn),
                ),
                Text(
                  "odapo138@gmail.com",
                  style: TextStyles.style24extrabold,
                  textAlign: TextAlign.center,
                ),
                InkWell(
                  onTap: () {
                    Clipboard.setData(
                      const ClipboardData(text: "odapo138@gmail.com"),
                    );
                  },
                  child: SvgPicture.asset(
                    "assets/icons/copy.svg",
                    colorFilter: const ColorFilter.mode(white, BlendMode.srcIn),
                  ),
                ),
              ],
            ),
            verticalSpaceMedium(),
            Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 16,
              runSpacing: 12,
              children: [
                SvgPicture.asset(
                  "assets/icons/call.svg",
                  colorFilter: const ColorFilter.mode(white, BlendMode.srcIn),
                ),
                Text(
                  "+(234) 702 5214 514",
                  style: TextStyles.style24extrabold,
                  textAlign: TextAlign.center,
                ),
                InkWell(
                  onTap: () {
                    Clipboard.setData(
                      const ClipboardData(text: "+(234) 702 5214 514"),
                    );
                  },
                  child: SvgPicture.asset(
                    "assets/icons/copy.svg",
                    colorFilter: const ColorFilter.mode(white, BlendMode.srcIn),
                  ),
                ),
              ],
            ),
            verticalSpace(0.1),
            Text(
              "© 2025 All Rights Reserved by Oladapo Olatubosun",
              style: TextStyles.style16regular,
              textAlign: TextAlign.center,
            ),
            verticalSpace(0.02),
          ],
        )

        // width() > 950
        //     ? Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         children: [
        //           Container(
        //             padding: const EdgeInsets.all(
        //               30,
        //             ),
        //             width: width() * 0.37,
        //             decoration: BoxDecoration(
        //               color: valhalla,
        //               borderRadius: BorderRadius.circular(
        //                 15,
        //               ),
        //             ),
        //             child: Form(
        //               key: formKey,
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   GradientTextWidget(
        //                     size: widget.size,
        //                     text1: "Let's work together!",
        //                     fsize:
        //                         width() < 950 ? width() * 0.04 : width() * 0.023,
        //                   ),
        //                   Text(
        //                     "I code beautifully simple things and I love what I do. Just simple like that!",
        //                     style: TextStyles.style16regular,
        //                   ),
        //                   Row(
        //                     children: [
        //                       Expanded(
        //                         child: TextInputForm(
        //                           hint: "First Name",
        //                           bgColor: ebony.withOpacity(
        //                             0.8,
        //                           ),
        //                           validator: (value) {
        //                             if (value.isNotEmpty) {
        //                               return "Cannot be empty";
        //                             }
        //                             return null;
        //                           },
        //                         ),
        //                       ),
        //                       horizontalSpaceMedium(),
        //                       Expanded(
        //                         child: TextInputForm(
        //                           hint: "Last Name",
        //                           bgColor: ebony.withOpacity(
        //                             0.8,
        //                           ),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                   Row(
        //                     children: [
        //                       Expanded(
        //                         child: TextInputForm(
        //                           hint: "Email Address",
        //                           bgColor: ebony.withOpacity(
        //                             0.8,
        //                           ),
        //                           validator: (value) {
        //                             if (value.isNotEmpty) {
        //                               return "Cannot be empty";
        //                             }
        //                             return null;
        //                           },
        //                         ),
        //                       ),
        //                       horizontalSpaceMedium(),
        //                       Expanded(
        //                         child: TextInputForm(
        //                           hint: "Phone Number",
        //                           bgColor: ebony.withOpacity(
        //                             0.8,
        //                           ),
        //                         ),
        //                       ),
        //                     ],
        //                   ),
        //                   TextInputForm(
        //                     hint: "Message",
        //                     maxLines: 7,
        //                     bgColor: ebony.withOpacity(
        //                       0.8,
        //                     ),
        //                     validator: (value) {
        //                       if (value.isNotEmpty) {
        //                         return "Cannot be empty";
        //                       }
        //                       return null;
        //                     },
        //                   ),
        //                   AppButton(
        //                     onTap: () {
        //                       if (formKey.currentState!.validate()) {
        //                         sendEmail(
        //                           recipientEmail: emailTC.text,
        //                           subject:
        //                               "From ${firstNameTC.text},${lastNameTC.text},${phoneTC.text}",
        //                           body: messageTC.text,
        //                         );
        //                       }
        //                     },
        //                     title: "Send Message",
        //                   )
        //                 ],
        //               ),
        //             ),
        //           ),
        //           Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Row(
        //                 children: [
        //                   const Icon(
        //                     Icons.phone,
        //                     color: white,
        //                     size: 50,
        //                   ),
        //                   Column(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: [
        //                       Text(
        //                         "Phone",
        //                         style: TextStyles.style16regular,
        //                       ),
        //                       Text(
        //                         "+(234) 702 5214 514",
        //                         style: TextStyles.style24extrabold,
        //                       ),
        //                     ],
        //                   ),
        //                 ],
        //               ),
        //               verticalSpaceMedium(),
        //               Row(
        //                 children: [
        //                   const Icon(
        //                     Icons.email,
        //                     color: white,
        //                     size: 50,
        //                   ),
        //                   Column(
        //                     crossAxisAlignment: CrossAxisAlignment.start,
        //                     children: [
        //                       Text(
        //                         "Email",
        //                         style: TextStyles.style16regular,
        //                       ),
        //                       Text(
        //                         "odapo138@gmail.com",
        //                         style: TextStyles.style24extrabold,
        //                       ),
        //                     ],
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           )
        //         ],
        //       )
        //     : Column(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         children: [
        //           Row(
        //             children: [
        //               const Icon(
        //                 Icons.phone,
        //                 color: white,
        //                 size: 50,
        //               ),
        //               Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Text(
        //                     "Phone",
        //                     style: TextStyles.style16regular,
        //                   ),
        //                   Text(
        //                     "+(234) 702 5214 514",
        //                     style: TextStyles.style24extrabold,
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           ),
        //           verticalSpaceMedium(),
        //           Row(
        //             children: [
        //               const Icon(
        //                 Icons.email,
        //                 color: white,
        //                 size: 50,
        //               ),
        //               Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Text(
        //                     "Email",
        //                     style: TextStyles.style16regular,
        //                   ),
        //                   Text(
        //                     "odapo138@gmail.com",
        //                     style: TextStyles.style24extrabold,
        //                   ),
        //                 ],
        //               ),
        //             ],
        //           ),
        //           verticalSpace(0.1),
        //           Container(
        //             padding: const EdgeInsets.all(
        //               30,
        //             ),
        //             decoration: BoxDecoration(
        //               color: valhalla.withOpacity(0.6),
        //               borderRadius: BorderRadius.circular(
        //                 15,
        //               ),
        //             ),
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 GradientTextWidget(
        //                   size: widget.size,
        //                   text1: "Let's work together!",
        //                   fsize: 35,
        //                 ),
        //                 Text(
        //                   "I code beautifully simple things and I love what I do. Just simple like that!",
        //                   style: TextStyles.style16regular,
        //                 ),
        //                 Row(
        //                   children: [
        //                     Expanded(
        //                       child: TextInputForm(
        //                         hint: "First Name",
        //                         bgColor: ebony.withOpacity(
        //                           0.8,
        //                         ),
        //                       ),
        //                     ),
        //                     horizontalSpaceMedium(),
        //                     Expanded(
        //                       child: TextInputForm(
        //                         hint: "Last Name",
        //                         bgColor: ebony.withOpacity(
        //                           0.8,
        //                         ),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //                 Row(
        //                   children: [
        //                     Expanded(
        //                       child: TextInputForm(
        //                         hint: "Email Address",
        //                         bgColor: ebony.withOpacity(
        //                           0.8,
        //                         ),
        //                       ),
        //                     ),
        //                     horizontalSpaceMedium(),
        //                     Expanded(
        //                       child: TextInputForm(
        //                         hint: "Phone Number",
        //                         bgColor: ebony.withOpacity(
        //                           0.8,
        //                         ),
        //                       ),
        //                     ),
        //                   ],
        //                 ),
        //                 TextInputForm(
        //                   hint: "Message",
        //                   maxLines: 7,
        //                   bgColor: ebony.withOpacity(
        //                     0.8,
        //                   ),
        //                 ),
        //                 AppButton(
        //                   onTap: () {
        //                     sendEmail(
        //                       recipientEmail: emailTC.text,
        //                       subject:
        //                           "From ${firstNameTC.text},${lastNameTC.text},${phoneTC.text}",
        //                       body: messageTC.text,
        //                     );
        //                   },
        //                   title: "Send Message",
        //                 )
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        );
  }

  // Future<void> sendEmail({
  //   required String recipientEmail,
  //   required String subject,
  //   required String body,
  // }) async {
  //   final Uri emailUri = Uri(
  //     scheme: 'mailto',
  //     path: recipientEmail,
  //     queryParameters: {
  //       'subject': subject,
  //       'body': body,
  //     },
  //   );

  //   if (await canLaunchUrl(emailUri)) {
  //     await launchUrl(emailUri);
  //   } else {
  //     throw Exception('Could not launch email client');
  //   }
  // }
}
