///
//  Generated code. Do not modify.
//  source: test.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'test.pbenum.dart';

export 'test.pbenum.dart';

class ConvGroupAtInfo extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'ConvGroupAtInfo', createEmptyInstance: create)
    ..e<ApplyJoinOpt>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'atType', $pb.PbFieldType.OE, defaultOrMaker: ApplyJoinOpt.AJO_ZERO, valueOf: ApplyJoinOpt.valueOf, enumValues: ApplyJoinOpt.values)
    ..aInt64(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'seqId')
    ..hasRequiredFields = false
  ;

  ConvGroupAtInfo._() : super();
  factory ConvGroupAtInfo({
    ApplyJoinOpt? atType,
    $fixnum.Int64? seqId,
  }) {
    final _result = create();
    if (atType != null) {
      _result.atType = atType;
    }
    if (seqId != null) {
      _result.seqId = seqId;
    }
    return _result;
  }
  factory ConvGroupAtInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConvGroupAtInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConvGroupAtInfo clone() => ConvGroupAtInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConvGroupAtInfo copyWith(void Function(ConvGroupAtInfo) updates) => super.copyWith((message) => updates(message as ConvGroupAtInfo)) as ConvGroupAtInfo; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConvGroupAtInfo create() => ConvGroupAtInfo._();
  ConvGroupAtInfo createEmptyInstance() => create();
  static $pb.PbList<ConvGroupAtInfo> createRepeated() => $pb.PbList<ConvGroupAtInfo>();
  @$core.pragma('dart2js:noInline')
  static ConvGroupAtInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConvGroupAtInfo>(create);
  static ConvGroupAtInfo? _defaultInstance;

  @$pb.TagNumber(1)
  ApplyJoinOpt get atType => $_getN(0);
  @$pb.TagNumber(1)
  set atType(ApplyJoinOpt v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAtType() => $_has(0);
  @$pb.TagNumber(1)
  void clearAtType() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get seqId => $_getI64(1);
  @$pb.TagNumber(2)
  set seqId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSeqId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSeqId() => clearField(2);
}

