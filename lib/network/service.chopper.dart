// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$service extends service {
  _$service([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = service;

  @override
  Future<Response> getMajor() {
    final $url = '/majors';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }
}
