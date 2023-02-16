Feature: IAM (6e7f40647928a2cde1fea212524f2f0c})

    Scenario: Principal context is working in async invocations
      Then principal context is working as expected

    Scenario: Can authenticate system
      When authenticating system
      Then system is authenticated

    Scenario: Can add has permission to command handler
      Given principal
      And command handler with has permission attribute is auto wired
      When command is send
      Then permission is checked

    Scenario: Can add has permission to query handler
      Given principal
      And query handler with has permission attribute is auto wired
      When query is send
      Then permission is checked

    Scenario: Can add is authorized to command handler
      Given principal
      And command handler with is authorized attribute is auto wired
      When command is send
      Then is authorized for command is checked

    Scenario: Can add is authorized to query handler
      Given principal
      And query handler with is authorized attribute is auto wired
      When query is send
      Then is authorized for query is checked

    Scenario: Can authorize permissions
      Given principal
      When authorizing with valid permissions
      Then task is handled

    Scenario: Cannot authorize with no permissions
      Given no principal
      When authorizing with valid permissions
      Then task is handled with exception "NotAuthenticatedException"

    Scenario: Cannot authorize with no principal
      Given principal
      When authorizing with no permissions
      Then task is handled with exception "ArgumentNullException"

    Scenario: Cannot authorize with unknown permissions
      Given principal
      When authorizing with unknown permissions
      Then task is handled with exception "KeyNotFoundException"

    Scenario: Cannot authorize with invalid permissions
      Given principal with invalid permissions
      When authorizing with valid permissions
      Then task is handled with exception "MissingPermissionsException"