Feature: CQRS commands

    Background:
        Given command handler is auto wired

    Scenario: Can send command
        When command is send
        Then command is handled

    Scenario: Cannot auto wire second command handler of same command type
        When second command handler is auto wired
        Then exception is raised

    Scenario: Can use command aspect
        Given command aspect is autowired
        When command is send
        Then command is handled
        And aspect is executed

    Scenario: Can use generic command aspect
        Given generic command aspect is autowired
        When command is send
        Then command is handled
        And aspect is executed

    Scenario: Can use multiple command aspects
        Given generic command aspect is autowired
        And command aspect is autowired
        When command is send
        Then command is handled
        And aspect is executed twice

    Scenario: Command aspect can stop pipeline
        Given generic command aspect is autowired
        And next is not executed
        When command is send
        Then command is not handled
    
    Scenario: Can activate command aspect with attribute
        Given attributed command handler is auto wired
        When command is send
        Then command is handled
        And attribute aspect is executed
        