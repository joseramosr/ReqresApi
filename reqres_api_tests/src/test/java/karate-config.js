function fn() {

  var config = {
    baseUrl:'https://reqres.in/api'
  };

  karate.configure('connectTimeout', 30000);
  karate.configure('readTimeout', 30000);
  return config;
}
