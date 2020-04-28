class DataTransformation {
  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    if (htmlText == null) {
      return '';
    }
    if (htmlText.contains(exp)) {
      return htmlText.replaceAll(exp, '');
    } else {
      return htmlText;
    }
  }
}
