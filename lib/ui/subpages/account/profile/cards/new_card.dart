import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:uccd_flutter/core/style/colors.dart';
import 'package:uccd_flutter/core/style/themes.dart';
import 'package:uccd_flutter/core/widgets/global/default_eleveted_button.dart';
import 'package:uccd_flutter/core/widgets/global/default_text_form_field.dart';

class NewCardPage extends StatefulWidget {
  const NewCardPage({super.key});

  @override
  State<NewCardPage> createState() => _NewCardPageState();
}

class _NewCardPageState extends State<NewCardPage> {
  late final TextEditingController cardNumberController;
  late final TextEditingController cardDateController;
  late final TextEditingController cvvCardController;

  @override
  void initState() {
    super.initState();
    cardNumberController = TextEditingController();
    cardDateController = TextEditingController();
    cvvCardController = TextEditingController();
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    cardDateController.dispose();
    cvvCardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: appBarPage(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 8.h,
              ),
              Text('Card Number',style: AppStyle.brawnText,),
              SizedBox(height: 1.h,),
              DefaultTextFormField(
                hint: "xxxx xxxx xxxx xxxx",
                controller: cardNumberController,
                validator: (_) {
                  return null;
                },
                keyboardtype: TextInputType.number,
              ),
              SizedBox(
                height: 4.h,
              ),
              Text('Expiry Date',style: AppStyle.brawnText,),
              SizedBox(height: 1.h,),
              DefaultTextFormField(
                hint: "MM / YY",
                controller: cardDateController,
                validator: (_) {
                  return null;
                },
                keyboardtype: TextInputType.datetime,
              ),
              SizedBox(
                height: 4.h,
              ),
              Text('CCV',style: AppStyle.brawnText,),
              SizedBox(height: 1.h,),
              DefaultTextFormField(
                hint: "***",
                controller: cvvCardController,
                validator: (_) {
                  return null;
                },
                keyboardtype: TextInputType.number,
              ),
              Spacer(),
              DefaultElevetedButton(title: "Add Card", onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBarPage(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        'NewCard',
        style: AppStyle.headline1Orange,
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: AppColors.orange,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
