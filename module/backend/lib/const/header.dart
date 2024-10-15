const Map<String,String> defautHeaders = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Secure-Code': '4ROY0pGr6z3lTYwSFCz0f8du2YqzfM',
  'Authorization': '',
};

Map<String,String> customHeaders(String token) => {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
  'Secure-Code': '4ROY0pGr6z3lTYwSFCz0f8du2YqzfM',
  'Authorization': 'Bearer $token',
};