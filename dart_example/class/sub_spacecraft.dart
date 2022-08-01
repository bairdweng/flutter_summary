import './spacecraft.dart';

// 继承的写法
class SubSpacecraft extends Spacecraft {
  SubSpacecraft(String name, DateTime? launch) : super(name, launch);
}
