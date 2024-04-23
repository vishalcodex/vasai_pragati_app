import 'package:flutter/material.dart';

import 'deposit/deposit_loan_detail_view.dart';
import 'gold/gold_loan_detail_view.dart';
import 'personal/personal_loan_detail_view.dart';
import 'secured/secured_loan_detail_view.dart';

class DetailsAlert extends StatelessWidget {
  final String page;
  const DetailsAlert({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    // double ffem = fem * 0.97;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0 * fem, vertical: 30 * fem),
      child: Dialog(
        insetPadding: EdgeInsets.zero,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 15.0 * fem, vertical: 10 * fem),
          child: page == "Personal"
              ? const PersonalLoanDetailView()
              : page == "Secured"
                  ? const SecuredLoanDetailView()
                  : page == "Gold"
                      ? const GoldLoanDetailView()
                      : page == "Deposit"
                          ? const DepositLoanDetailView()
                          : Container(),
        ),
      ),
    );
  }
}
