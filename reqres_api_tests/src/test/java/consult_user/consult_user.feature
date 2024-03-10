Feature: Pruebas para el servicio de consulta de usuario del API regres.in

  Background:
    * url baseUrl
    * header accept = 'application/json'
    * def responseData = read('./consult_user_response_data.json')

  # Se validará que el status code de la solicitud sea 200 y que la respuesta tenga la estructura adecuada y los datos propios del usuario consultado.
  Scenario Outline: Obtener información de un usuario específico por medio de su ID: <userID>
    Given path '/users/<userId>'
    When method GET
    Then status 200
    And match response == <expectedData>
    Examples:
      | userId | expectedData         |
      | 1      | responseData.userId1 |
      | 2      | responseData.userId2 |
