Feature: SMTP

  Scenario: Can send an email
    When the email is sent
    Then the email is recieved