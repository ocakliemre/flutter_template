class ServiceConstants {
  static String baseUrl =
      'http://192.168.1.41:8091/'; //TODO: Emre: Çağrıldığında hive üzerinden kayıtlı olan alınmalı, bu şekilde background işlemleri yaparken buradaki halini alıyor.
  static const Duration serviceTimeout = Duration(milliseconds: 30000);

  ///Login
  static const String authLogin = 'api/Auth/Login';

  ///User
  static const String userGetUserById = 'api/User/GetById';

  ///System Log
  static const String systemLogAdd = 'api/SystemLog/Add';

  ///My Works
  static const String getMyWorks = '/api/Work/GetList';

  ///Works At The Pool
  static const String getWorksAtThePoolRequest = '/api/Work/GetList';
}
