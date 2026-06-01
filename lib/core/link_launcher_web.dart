import 'dart:js_interop';

@JS('window.location.assign')
external void _assignLocation(String url);

Future<void> openExternalLink(String url) async {
  _assignLocation(url);
}
