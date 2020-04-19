Feature: Hello Cucumber

  Scenario: Health Endpoint
    When A user makes a get request to the homepage
    Then The user sees a json response
