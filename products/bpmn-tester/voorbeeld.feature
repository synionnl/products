Feature: Process

Scenario Outline: Exclusive gateway tests

  Given process "blog/bizdevops/living-documentation/process.bpmn"
    And process has state "<state>"
   When the gateway with id "<gateway>" is executed
   Then the flow with id "<flow>" must be activated

  Examples: Scenarios
    | state                            | gateway                 | flow                    | 
    | { AnswerCorrectProbability: 84 } | Gateway_UseBotAnswer    | Flow_UseBotAnswerNo     | 
    | { AnswerCorrectProbability: 85 } | Gateway_UseBotAnswer    | Flow_UseBotAnswerYes    | 
    | { AnswerCorrectProbability: 94 } | Gateway_ReviewBotAnswer | Flow_ReviewBotAnswerYes | 
    | { AnswerCorrectProbability: 95 } | Gateway_ReviewBotAnswer | Flow_ReviewBotAnswerNo  | 