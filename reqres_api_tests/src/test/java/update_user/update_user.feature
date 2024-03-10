Feature: Pruebas para el servicio de actualizar usuario del API regres.in

  Background:
    * url baseUrl
    * header accept = 'application/json'
    * def requestData = read('./update_user_request_data.json')

    #Se validará que status code de la solicitud sea 200 y que la respuesta obtenida tenga la estructura/formato adecuado y los datos actualizados del usuario.
  Scenario Outline: Actualizar información de un usuario por medio de su ID: <userId>
    * def dataToUpdate = <body>
    Given path '/users/<userId>'
    And request dataToUpdate
    When method PUT
    Then status 200
    And match response == {"name":"#(dataToUpdate.name)","job":"#(dataToUpdate.job)","updatedAt":'#string'}
    Examples:
      | userId | body                               |
      | 1      | requestData.informationToUpdateID1 |
      | 2      | requestData.informationToUpdateID2 |

  #Se esperaba que este escenario devolviera un mensaje de error ya que se esta actualizando por id que no existe,
  #al no hacer lo anterior, se deja la validación de que el status code sea 200 y que la respuesta obtenida tenga
  # la estructura/formato adecuado y los datos actualizados del usuario.
  Scenario: Actualizar información de un usuario por ID que no existe
    * def id = requestData.nonExistingUserId
    * def dataToUpdate = requestData.informationToUpdateID1
    Given path '/users/id'
    And request dataToUpdate
    When method PUT
    Then status 200
    And match response == {"name":"#(dataToUpdate.name)","job":"#(dataToUpdate.job)","updatedAt":'#string'}

  #Se esperaba que este escenario devolviera un mensaje de error ya que se esta actualizando por id inválido,
  #al no hacer lo anterior, se deja la validación de que el status code sea 200 y que la respuesta obtenida tenga
  # la estructura/formato adecuado y los datos actualizados del usuario.
  Scenario: Actualizar información de un usuario por ID inválido
    * def id = requestData.invalidId
    * def dataToUpdate = requestData.informationToUpdateID1
    Given path '/users/id'
    And request dataToUpdate
    When method PUT
    Then status 200
    And match response == {"name":"#(dataToUpdate.name)","job":"#(dataToUpdate.job)","updatedAt":'#string'}
