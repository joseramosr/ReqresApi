Feature: Pruebas para el servicio de registro de usuario del API regres.in

  Background:
    * url baseUrl
    * header Content-Type = 'application/json'
    * def requestBody = read('./register_user_request_data.json')

    #Se validará que status code de la solicitud sea 200 y que el id obtenido sea un número no null y el token un string no null.
    #Como en este escenario el id y el token siempre son los mismos, podemos añadir la validación de sus valores esperados, como
    #Se ve en la segunda asersión.
    Scenario: Resgistro de usuario exitoso
      Given path '/register'
      And request requestBody.successfulUser
      When method POST
      Then status 200
      And match response == {"id": #number,"token": '#string'}
      And match response == {"id": 4,"token": "QpwL5tke4Pnpja7X4"}
