Feature: Pruebas para el servicio de login del API reqres.in

  Background:
    * url baseUrl
    * headers {"Content-Type": 'application/json', "accept": 'application/json'}
    * def requestData = read('./login_request_data.json')

  #Se validará que status code de la solicitud sea 200 y que el token de la respuesta sea un string no null.
  # Para este caso donde el token siempre es el mismo, podemos añadir la validación exacta del token como se ve en la segunda asersión.
  Scenario: Login exitoso con email
    Given path '/login'
    And request requestData.successLoginWithEmail
    When method POST
    Then status 200
    And match response == {"token":'#string'}
    And match response == {"token":"QpwL5tke4Pnpja7X4"}