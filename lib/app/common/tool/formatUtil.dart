String numFormat(int num) {
  String views = "";
  if (num > 9999) {
    views = "${(num / 10000).toStringAsFixed(2)}万";
  } else {
    views = num.toString();
  }
  return views;
}
