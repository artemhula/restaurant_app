import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/features/auth/domain/usecases/check_otp.dart';
import 'package:restaurant/features/auth/domain/usecases/send_otp.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.sendOtp, this.checkOtp) : super(AuthInitial());

  late String verificationId;
  SendOtp sendOtp;
  CheckOtp checkOtp;

  void sendCodeToPhone({required String phoneNumber}) async {
    emit(AuthLoading());
    print(phoneNumber);
    final result = await sendOtp(phoneNumber);
    print('sended');
    result.fold(
      (l) => emit(AuthFailure(l.message)),
      (id) {
        verificationId = id;
        emit(OtpSended(phoneNumber: phoneNumber));
      },
    );
  }

  void verifyCode({required String smsCode}) async {
    emit(AuthLoading());
    final result = await checkOtp(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    result.fold(
      (l) => emit(AuthFailure(l.message)),
      (r) => emit(OtpVerified()),
    );
  }
}
