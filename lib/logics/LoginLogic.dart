abstract class LoginLogic{
  Future<String> login(String email,String password);
  Future<String> logout();
  isEmailValid(String email);
}

class LoginException implements Exception{}

class SimpleLoginLogic extends LoginLogic{
  @override
  Future<String> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 2));
    if(email!='demo@demo.com' || password !="123456"){
      throw LoginException();
    }
    return "un token";
  }

  @override
  isEmailValid(String email){
    if(email.contains('@')){
      return true;
    }else{
      return false;
    }
  }

  @override
  Future<String> logout() async {
    // TODO: implement logout
    return "";
  }

}