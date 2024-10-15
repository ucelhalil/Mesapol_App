enum EndPoint{
  login('/login'), // module/backend/lib/enum/endpoint.dart: login,
  register('/register'), // module/backend/lib/enum/endpoint.dart: register,
  //----------------------------------

  ;
  String withId({String? id}){
    return '$point/$id';
  }

  final String point;
  const EndPoint(this.point);
}