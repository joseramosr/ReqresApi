Feature: Pruebas para el servicio de eliminar usuario del API regres.in

  Background:
    * url baseUrl
    * header accept = '*/*'
    * def requestData = read('./delete_user_request_data.json')

  #Se validará que la solicitud se haya completado, verificando que el estatus code sea 204
  Scenario: Eliminar usuario existente por medio de su ID
    Given path '/users/requestData.IdToDelete'
    When method DELETE
    Then status 204