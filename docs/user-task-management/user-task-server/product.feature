Feature: User task server product

    Scenario: May not review own answer
        Given a review anwser task
        And "john" is the person who has created the answer
        And "john" is the user
        When the user claims the task
        Then an authorization exception must be thrown
        And the task should not be claimed

    Scenario: May not delegate review task to the person who answered the question
        Given a review answer task
        And "john" is the person who has created the answer
        And "julia" is the person who has claimed the task
        And "julia" is the user
        When the user delegates the task to "john"
        Then an authorization exception must be thrown
        And the task should not be delegated