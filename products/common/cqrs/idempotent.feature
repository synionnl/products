Feature: Idempotent command handling

    Scenario: Can send command with idempotent attribute
        Given command handler with idempotent attribute is auto wired
        And database
        When command is send
        Then command is handled once

    Scenario: Can send command twice with idempotent attribute
        Given command handler with idempotent attribute is auto wired
        And database
        When command is send
        And command is send
        Then command is handled once

    Scenario: Can send different command with same command id when idempotent attribute is present
        Given command handler with idempotent attribute is auto wired
        And database
        When command is send 
        When same command is send with different value
        Then duplicate command id exception is thrown