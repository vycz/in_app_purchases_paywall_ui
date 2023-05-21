import 'package:flutter/material.dart';
import 'package:in_app_purchases_paywall_ui/paywall/base/base_paywall.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/active_plan.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/icon_and_text.dart';
import 'package:in_app_purchases_interface/in_app_purchases_interface.dart';
import 'package:in_app_purchases_paywall_ui/paywall/model/text_and_url.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/simple_paywall_purchase.dart';
import 'package:in_app_purchases_paywall_ui/paywall/simple/simple_paywall_success.dart';

///
/// This Widget is without a scaffold. Wrap it with PayWallScaffold
/// if you want to include an appBar to your screen
///
/// The Paywall Library is made by LinkFive - Flutter Subscription Management https://www.linkfive.io/
///
/// ignore: must_be_immutable
class SimplePaywall extends BasePaywall {
  /// Define the Design through the Theme you apply in your
  /// root theme: ThemeData(...)
  /// Icons are colored with iconTheme: IconThemeData(color: Colors.teal)
  SimplePaywall({
    String? title,
    String? subTitle,
    String? continueText,
    TextAndUrl? tosData,
    TextAndUrl? ppData,
    Widget? headerContainer,
    List<IconAndText>? bulletPoints,
    Widget? campaignWidget,
    String? restoreText,
    String? successTitle,
    String? successSubTitle,
    Widget? successWidget,
    bool isSubscriptionLoading = false,
    bool isPurchaseInProgress = false,
    PurchaseState? purchaseState = null,
    List<SubscriptionData>? subscriptionListData = null,
    CallbackInterface? callbackInterface = null,
    PurchaseStateStreamInterface? purchaseStateStreamInterface = null,
    List<ActivePlan>? activePlanList = null,
  }) : super(
          title: title,
          subTitle: subTitle,
          continueText: continueText,
          tosData: tosData,
          ppData: ppData,
          headerContainer: headerContainer,
          bulletPoints: bulletPoints,
          campaignWidget: campaignWidget,
          restoreText: restoreText,
          successTitle: successTitle,
          successSubTitle: successSubTitle,
          successWidget: successWidget,
          isSubscriptionLoading: isSubscriptionLoading,
          isPurchaseInProgress: isPurchaseInProgress,
          purchaseState: purchaseState ?? PurchaseState.NOT_PURCHASED,
          subscriptionListData: subscriptionListData,
          callbackInterface: callbackInterface,
          purchaseStateStreamInterface: purchaseStateStreamInterface,
          activePlanList: activePlanList,
        );

  @override
  State createState() => _SimplePaywallState();
}

/// State to control the State Streams
class _SimplePaywallState extends BasePaywallState<SimplePaywall> {
  @override
  Widget buildPaywall(BuildContext context, ThemeData theme) {
    return SimplePaywallPurchase(
        callbackInterface: widget.callbackInterface,
        isSubscriptionLoading: widget.isSubscriptionLoading);
  }

  @override
  Widget buildSuccess(BuildContext context, ThemeData theme) {
    return SimplePaywallSuccess();
  }
}
