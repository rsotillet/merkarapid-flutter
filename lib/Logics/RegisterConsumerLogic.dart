abstract class RegisterConsumerLogic{
  Future<dynamic> register(String email,String password);
}

class LoginException implements Exception{}

class SimpleRegisterConsumerLogic extends RegisterConsumerLogic{
  @override
  Future register(String email, String password) {
    // TODO: implement register
    return null;
  }

}

