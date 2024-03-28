
import 'package:ecomapp/utils/network/api_endpoits.dart';
import 'package:ecomapp/utils/network/network_helper.dart';

class AuthRepository {
  final networkHelpper = NetworkHelpper();
  Future getData() async {
    try {
      var response = await networkHelpper.dioRequestPublic(
        url: ApiEndPoints.baseUrl,
        method: DioMethod.get,
      );
      final json = response as List<dynamic>;
      return json;
    } catch (e) {
      throw Exception(e);
    }
  }
}
