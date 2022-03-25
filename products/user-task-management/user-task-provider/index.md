# User task provider

## Product

The user task provider is the owner of a user task. It is reponsible to determine if the user is authorized for a user task and it must handle user task related actions. A user task provider has the choice to create an implementation on different levels:

1. Implement the openapi specication directly being free to choose a language and framework;
1. Implement a specific framework adapter;
1. Implement a specific user-task provider;

* [API](product.openapi.yaml)
* [Acceptance criteria](product.feature)

## Class diagram

```plantuml

interface OpenApi {
    List<UserTask> GetMyUserTasks(Integer limit)
    UserTask GetMyUserTask(String userTaskId)
    void ClaimUserTask(String userTaskId)
    void DelayMyUserTask(String userTaskId, LocalDateTime delayUntil)
    void DelegateMyUserTask(String userTaskId, String delegateTo, String message)
    List<UserTaskDelegator> GetMyUserTaskDelegators(String userTaskId, Integer limit, String offset)
}

abstract class JavaRestServer implements OpenApi
{
    abstract List<UserTask> GetMyUserTasks(Integer limit)
    abstract UserTask GetMyUserTask(String userTaskId)
    abstract void ClaimUserTask(String userTaskId)
    abstract void DelayMyUserTask(String userTaskId, LocalDateTime delayUntil)
    abstract void DelegateMyUserTask(String userTaskId, String delegateTo, String message)
    abstract List<UserTaskDelegator> GetMyUserTaskDelegators(String userTaskId, Integer limit, String offset)
}

abstract class "CamundaAdapter" as JavaCamundaAdapter implements JavaRestServer
{
    abstract Boolean IsAuthorized(CamundaUserTask userTask)
    abstract UserTask Map(CamundaUserTask userTask)
    abstract List<UserTaskDelegator> GetMyUserTaskDelegators(String userTaskId, Integer limit, String offset)
}

abstract class "ZeebeAdapter" as JavaZeebeAdapter implements JavaRestServer
{
    abstract Boolean IsAuthorized(ZeebeUserTask userTask)
    abstract UserTask Map(ZeebeUserTask userTask)
    abstract List<UserTaskDelegator> GetMyUserTaskDelegators(String userTaskId, Integer limit, String offset)
}

abstract class CSharpRestServer implements OpenApi
{
    abstract List<UserTask> GetMyUserTasks(Integer limit)
    abstract UserTask GetMyUserTask(String userTaskId)
    abstract void ClaimUserTask(String userTaskId)
    abstract void DelayMyUserTask(String userTaskId, LocalDateTime delayUntil)
    abstract void DelegateMyUserTask(String userTaskId, String delegateTo, String message)
    abstract List<UserTaskDelegator> GetMyUserTaskDelegators(String userTaskId, Integer limit, String offset)
}

abstract class "CamundaAdapter" as CSharpCamundaAdapter implements CSharpRestServer
{
    abstract Task<bool> IsAuthorized(CamundaUserTask userTask)
    abstract Task<UserTask> Map(CamundaUserTask userTask)
    abstract Task<List<UserTaskDelegator>> GetMyUserTaskDelegators(string userTaskId, int limit, string offset)
}

abstract class "ZeebeAdapter" as CSharpZeebeAdapter implements CSharpRestServer
{
    abstract Task<bool> IsAuthorized(ZeebeUserTask userTask)
    abstract Task<UserTask> Map(ZeebeUserTask userTask)
    abstract Task<List<UserTaskDelegator>> GetMyUserTaskDelegators(string userTaskId, int limit, string offset)
}

class "Provider" as Provider0 implements OpenApi
class "Provider" as ProviderJava implements JavaRestServer
class "Provider" as ProviderCSharp implements CSharpRestServer
class "Provider" as Provider1 implements JavaCamundaAdapter
class "Provider" as Provider2 implements JavaZeebeAdapter
class "Provider" as Provider3 implements CSharpCamundaAdapter
class "Provider" as Provider4 implements CSharpZeebeAdapter
```



