Feature: CQRS commands

    Scenario: Can send command
        Given command handler is auto wired
        When command is send
        Then command is handled once

    Scenario: Cannot auto wire second command handler of same command type
        Given command handler is auto wired
        When second command handler is auto wired
        Then multiple command handlers exception is raised

    Scenario: Can use command aspect
        Given command handler is auto wired
        And command aspect is autowired
        When command is send
        Then command is handled once
        And command aspect is executed

    Scenario: Can use generic command aspect
        Given command handler is auto wired
        And generic command aspect is autowired
        When command is send
        Then command is handled once
        And command aspect is executed

    Scenario: Can use multiple command aspects
        Given command handler is auto wired
        And generic command aspect is autowired
        And command aspect is autowired
        When command is send
        Then command is handled once
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
        Then command is handled once
        And command attribute aspect is executed
    
    Scenario: Can add transaction scope to command handler
        Given command handler with transaction scope attribute is auto wired
        When command is send
        Then transaction scope is set

    @Database
    Scenario: Can send command with idempotent attribute
        Given command handler with idempotent attribute is auto wired
        When command is send
        Then command is handled once

    @Database
    Scenario: Can send command twice with idempotent attribute
        Given command handler with idempotent attribute is auto wired
        When command is send twice
        Then command is handled once

    @Database
    Scenario: Cannot send different command with same command id when idempotent attribute is present
        Given command handler with idempotent attribute is auto wired
        When same command is send with different value
        Then duplicate command id exception is thrown