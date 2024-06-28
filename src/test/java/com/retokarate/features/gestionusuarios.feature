Feature: RetoKarate API Testing

  Background:
    * url 'https://reqres.in/api'

  Scenario: Consultar usuario con ID valido
    Given path 'users/2'
    When method get
    Then status 200
    And match response.data.id == 2
    And match response.data.email == "janet.weaver@reqres.in"

  Scenario: Consultar usuario con ID invalido
    Given path 'users/200'
    When method get
    Then status 404

  Scenario: actualizar usuario
    Given path 'users/2'
    And request { "firstname": "jhojan", "email": "jc.kmilo22@gmail.com" }
    When method put
    Then status 200
    And match response.firstname == "jhojan"
    And match response.email == "jc.kmilo22@gmail.com"


  Scenario: Eliminar usuario
    Given path 'users/2'
    When method delete
    Then status 204

  Scenario: Validar usuario eliminado en lista de usuarios
    Given path 'users'
    When method get
    Then status 200
    And match response.data[1].id != 2
