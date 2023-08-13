///
//  Generated code. Do not modify.
//  source: test.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use applyJoinOptDescriptor instead')
const ApplyJoinOpt$json = const {
  '1': 'ApplyJoinOpt',
  '2': const [
    const {'1': 'AJO_ZERO', '2': 0},
    const {'1': 'AJO_NEED_APPROVE', '2': 1},
    const {'1': 'AJO_FREE_ACCESS', '2': 2},
    const {'1': 'AJO_DISABLE_APPLY', '2': 3},
    const {'1': 'AJO_NEED_AGREE', '2': 4},
  ],
};

/// Descriptor for `ApplyJoinOpt`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List applyJoinOptDescriptor = $convert.base64Decode(
    'CgxBcHBseUpvaW5PcHQSDAoIQUpPX1pFUk8QABIUChBBSk9fTkVFRF9BUFBST1ZFEAESEwoPQUpPX0ZSRUVfQUNDRVNTEAISFQoRQUpPX0RJU0FCTEVfQVBQTFkQAxISCg5BSk9fTkVFRF9BR1JFRRAE');
@$core.Deprecated('Use convGroupAtInfoDescriptor instead')
const ConvGroupAtInfo$json = const {
  '1': 'ConvGroupAtInfo',
  '2': const [
    const {
      '1': 'at_type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.ApplyJoinOpt',
      '10': 'atType'
    },
    const {'1': 'seq_id', '3': 2, '4': 1, '5': 3, '10': 'seqId'},
  ],
};

/// Descriptor for `ConvGroupAtInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List convGroupAtInfoDescriptor = $convert.base64Decode(
    'Cg9Db252R3JvdXBBdEluZm8SJgoHYXRfdHlwZRgBIAEoDjINLkFwcGx5Sm9pbk9wdFIGYXRUeXBlEhUKBnNlcV9pZBgCIAEoA1IFc2VxSWQ=');
