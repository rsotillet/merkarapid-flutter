abstract class RegisterCommerceLogic{
  Future<dynamic> register(String email,String password);
}

class LoginException implements Exception{}

class SimpleRegisterCommerceLogic extends RegisterCommerceLogic{
  @override
  Future register(String email, String password) {
    // TODO: implement register
    return null;
  }


}

