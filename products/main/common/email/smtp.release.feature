Feature: SMTP (7481b0f2b641be2e10708c8454c1bd9c)

  Scenario: Can send an email
    When the email is sent
    Then the email is recieved