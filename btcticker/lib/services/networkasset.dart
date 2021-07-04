import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

const int kHttpSuccessCode = 200;

class NetworkAsset {
  Future<dynamic> getData(String inputUrl) async {
    Uri url = Uri.parse(inputUrl);

    try {
      http.Response response = await http.get(url);

      // Status Code Legend
      // 1** = Hang on
      // 2** = Success
      // 3** = No Access
      // 4** = You are screwed
      // 5** = I am screwed
      if (response.statusCode == kHttpSuccessCode) {
        return convert.jsonDecode(response.body);
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    } //try-catch
  }
}
