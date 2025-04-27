
import 'package:freezed_annotation/freezed_annotation.dart';

part 'Counter.freezed.dart';

@freezed
class SplashCounter with _$SplashCounter{
  const factory SplashCounter(int count1,int count2) = _SplashCounter;
}