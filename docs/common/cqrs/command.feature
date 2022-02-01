Feature: CQRS commands

    Scenario: Can send command
        Given command handler is auto wired
        When command is send
        Then command is handled

    Scenario: Cannot auto wire second command handler of same command type
        Given command handler is auto wired
        When second command handler is auto wired
        Then command exception is raised

    Scenario: Can use command aspect
        Given command handler is auto wired
        And command aspect is autowired
        When command is send
        Then command is handled
        And command aspect is executed

    Scenario: Can use generic command aspect
        Given command handler is auto wired
        And generic command aspect is autowired
        When command is send
        Then command is handled
        And command aspect is executed

    Scenario: Can use multiple command aspects
        Given command handler is auto wired
        And generic command aspect is autowired
        And command aspect is autowired
        When command is send
        Then command is handled
        And command aspect is executed twice

    Scenario: Command aspect can stop pipeline
        Given command handler is auto wired
        And generic command aspect is autowired
        And command aspect next is not executed
        When command is send
        Then command is not handled
    
    Scenario: Can activate command aspect with attribute
        Given attributed command handler is auto wired
        When command is send
        Then command is handled
        And command attribute aspect is executed

    Scenario: Can add transaction scope to command handler
        Given command handler with transaction scope attribute is auto wired
        When command is send
        Then transaction scope is set

    Scenario: Can send command with idempotent attribute
        Given command handler with idempotent attribute is auto wired
        When command is send
        Then command is handled

    Scenario: Can send command twice with idempotent attribute
        Given command handler with idempotent attribute is auto wired
        When command is send
        When command is send
        Then command is handled once

    Scenario: Can send differtent command with same command id when idempotent attribute is present
        Given command handler with idempotent attribute is auto wired
        When command is send 
        When same command is send with differtent value
        Then duplicate command id exception is thrown