Feature: SMTP

  Scenario: Can send an email
    Given an email
    When the email is send
    Then the email is recvieved