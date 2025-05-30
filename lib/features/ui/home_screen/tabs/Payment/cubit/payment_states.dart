abstract class PaymentStates {}

class InitialPaymentState extends PaymentStates {}

// hna na b3ml el register bta3 paymob 3shan ageb el token el h3ml byha el order
// w bdylo el api key bta3y
class LoadingAuthTokenPaymentState extends PaymentStates {}

class SuccessAuthTokenPaymentState extends PaymentStates {}

class ErrorAuthTokenPaymentState extends PaymentStates {}

// hna bgeb el order Id b el token el gbtha mn fo2
class LoadingOrderIdPaymentState extends PaymentStates {}

class SuccessOrderIdPaymentState extends PaymentStates {}

class ErrorOrderIdPaymentState extends PaymentStates {}

// hna bdylo el token el gbtha mn el register w el order Id
// w bydeny el token el hdf3 byha
class LoadingRequestTokenPaymentState extends PaymentStates {}

class SuccessRequestTokenPaymentState extends PaymentStates {}

class ErrorRequestTokenPaymentState extends PaymentStates {}

// dy tre2t el df3 b code el khdma
class LoadingKioskRefCodePaymentState extends PaymentStates {}

class SuccessKioskRefCodePaymentState extends PaymentStates {}

class ErrorKioskRefCodePaymentState extends PaymentStates {}

