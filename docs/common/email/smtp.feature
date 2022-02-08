@Docker
Feature: SMTP

  Scenario: Can send an email
    Given an email
    When the email is sent
    Then the email is recieved