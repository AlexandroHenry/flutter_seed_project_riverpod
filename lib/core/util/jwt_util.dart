import 'dart:convert';

import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:jose_plus/jose.dart';
import 'package:package_info_plus/package_info_plus.dart';

class JwtUtil {
  static final JwtUtil _instance = JwtUtil._internal();
  factory JwtUtil() {
    return _instance;
  }

  JwtUtil._internal();

  String buildSignatureToken({
    required String secretKey,
    required Map<String, dynamic> payload,
    String? iss,
    Duration? expiresIn,
    bool? isBase64Encode = true,
  }) {
    payload.addAll({
      'exp': expiresIn == null
          ? (DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000) + const Duration(hours: 4).inSeconds
          : (DateTime.now().toUtc().millisecondsSinceEpoch ~/ 1000) + expiresIn.inSeconds,
      'iss': iss ?? GetIt.instance<PackageInfo>().packageName,
    });

    var claims = JsonWebTokenClaims.fromJson(payload);

    // create a builder, decoding the JWT in a JWS, so using a
    // JsonWebSignatureBuilder
    var builder = JsonWebSignatureBuilder();

    // set the content
    builder.jsonContent = claims.toJson();
    builder.setProtectedHeader('typ', 'JWT');

    // add a key to sign, can only add one for JWT
    builder.addRecipient(
      JsonWebKey.fromJson({
        'kty': 'oct',
        'k': isBase64Encode == true ? base64UrlEncode(secretKey) : secretKey,
      }),
      algorithm: 'HS256',
    );

    // build the jws
    var jws = builder.build();
    debugPrint('jws = ${jws.toCompactSerialization()}');
    return jws.toCompactSerialization();
  }

  JsonWebToken decodeToken(String token) {
    return JsonWebToken.unverified(token);
  }

  Future<JsonWebToken?> verifyToken(String token, List<dynamic> keys) async {
    var keyStore = JsonWebKeyStore();
    for (var element in keys) {
      keyStore.addKey(JsonWebKey.fromJson(element as Map<String, dynamic>));
    }

    try {
      var jwt = await JsonWebToken.decodeAndVerify(token, keyStore);
      debugPrint('verify payload: ${jwt.claims}');
      return jwt;
    } catch (e) {
      debugPrint('can\'t verify');
      return null;
    }
  }

  Future<JsonWebToken?> verifyTokenByPem(String token, List<String> pem) async {
    var keyStore = JsonWebKeyStore();
    for (var element in pem) {
      keyStore.addKey(
        JsonWebKey.fromPem(element),
      );
    }

    try {
      var jwt = await JsonWebToken.decodeAndVerify(token, keyStore);
      debugPrint('verify payload: ${jwt.claims}');
      return jwt;
    } catch (e) {
      debugPrint('can\'t verify');
      return null;
    }
  }

  Future<bool> isTokenExpiry(String token) async {
    var unverifiedJwt = JwtUtil().decodeToken(token);

    final now = clock.now();
    final diff = now.difference(unverifiedJwt.claims.expiry!);
    if (diff > Duration.zero) {
      return true;
    }
    return false;
  }

  String base64UrlEncode(String secret) {
    Codec<String, String> stringToBase64Url = utf8.fuse(base64Url);
    String encoded = stringToBase64Url.encode(secret);
    return encoded;
  }
}

extension JsonWebTokenClaimsX on JsonWebTokenClaims {

  Iterable<JoseException> validateX({
    Duration expiryTolerance = const Duration(),
    Uri? issuer,
    List<String>? clientId,
  }) sync* {
    final now = clock.now();
    final diff = now.difference(expiry!);
    if (diff > expiryTolerance) {
      yield JoseException(
        'JWT expired. Expiry ($expiry) is more than tolerance '
            '($expiryTolerance) before now ($now)',
      );
    }
    if (issuer != null && this.issuer != issuer) {
      yield JoseException(
        'Issuer does not match. Expected '
            '`$issuer`, was `${this.issuer}`',
      );
    }
    final aud = audience;
    if (clientId != null && clientId.isNotEmpty && (aud == null
        || clientId.where((element) => aud.contains(element)).toList().isEmpty)) {
      yield JoseException('Audiences does not contain clientId `$clientId`.');
    }
  }
}

class JoseExpireException extends JoseException {
  JoseExpireException(super.message);
}

class JoseIssuerException extends JoseException {
  JoseIssuerException(super.message);
}

class JoseAudienceException extends JoseException {
  JoseAudienceException(super.message);
}