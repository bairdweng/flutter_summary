///
//  Generated code. Do not modify.
//  source: test.proto
//
//  = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

// ignore_for_file: UNDEFINED_SHOWN_NAME
//@dart=2.17
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class ApplyJoinOpt extends $pb.ProtobufEnum {
  static const ApplyJoinOpt AJO_ZERO = ApplyJoinOpt._(
      0,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'AJO_ZERO');
  static const ApplyJoinOpt AJO_NEED_APPROVE = ApplyJoinOpt._(
      1,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'AJO_NEED_APPROVE');
  static const ApplyJoinOpt AJO_FREE_ACCESS = ApplyJoinOpt._(
      2,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'AJO_FREE_ACCESS');
  static const ApplyJoinOpt AJO_DISABLE_APPLY = ApplyJoinOpt._(
      3,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'AJO_DISABLE_APPLY');
  static const ApplyJoinOpt AJO_NEED_AGREE = ApplyJoinOpt._(
      4,
      const $core.bool.fromEnvironment('protobuf.omit_enum_names')
          ? ''
          : 'AJO_NEED_AGREE');

  static const $core.List<ApplyJoinOpt> values = <ApplyJoinOpt>[
    AJO_ZERO,
    AJO_NEED_APPROVE,
    AJO_FREE_ACCESS,
    AJO_DISABLE_APPLY,
    AJO_NEED_AGREE,
  ];

  static final $core.Map<$core.int, ApplyJoinOpt> _byValue =
      $pb.ProtobufEnum.initByValue(values);
  static ApplyJoinOpt? valueOf($core.int value) => _byValue[value];

  const ApplyJoinOpt._($core.int v, $core.String n) : super(v, n);
}
