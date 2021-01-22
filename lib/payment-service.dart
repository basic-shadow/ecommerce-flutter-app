import 'package:stripe_payment/stripe_payment.dart';

class StripeTransactionResponse {
  String message;
  bool success;
  StripeTransactionResponse({this.message, this.success});
}

class StripeService {
  static String secret = '';

  static init() {
    StripePayment.setOptions(StripeOptions(
        publishableKey:
            "pk_test_51ICVihIcRvXE7T0zlHBZyJ5nzklavUsvBYqN0cudVuHnabLtQInV6Y5R6FfGNHp1xNeCoaOM26BoXcYR2wLTiQnG00zgCUvHQT",
        merchantId: "Test",
        androidPayMode: 'test'));
  }

  static StripeTransactionResponse payViaExistingCard(
      {String price, String currency, dynamic card}) {
    return new StripeTransactionResponse(
        message: "Transaction successful", success: true);
  }

  static Future<StripeTransactionResponse> payWithNewCard(
      {String price, String currency}) async {
    try {
      PaymentMethod paymentMethod =
          await StripePayment.paymentRequestWithCardForm(
              CardFormPaymentRequest());
      return new StripeTransactionResponse(
          message: "Transaction successful", success: true);
    } catch (err) {
      return new StripeTransactionResponse(
          message: "Transaction failed: ${err.toString()}", success: false);
    }
  }
}
