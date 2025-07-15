// md5 加密
import 'dart:convert';
import 'package:crypto/crypto.dart';

class GenerateMD5 {

  // 生成 MD5
  static String generateMD5(String data) {
    var content = const Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return digest.toString();
  }
}
