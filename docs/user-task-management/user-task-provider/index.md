# User task provider

The user task provider is the owner of a user task. It is reponsible to determine if the user is authorized for a user task and it must handle user task related actions. A user task provider has the choice to create an implementation on different levels:

1. Implement the openapi specication directly being free to choose a framework;
1. Implement a specific framework adapter;
1. Implement a specific user-task provider;

```plantuml

interface OpenApi
abstract class JavaRestServer implements OpenApi
{
    abstract List<UserTask> GetMyUserTasks(Integer limit)
    abstract UserTask GetMyUserTask(String userTaskId)
    abstract void ClaimUserTask(String userTaskId)
    abstract void DelayUserTask(String userTaskId, LocalDateTime delayUntil)
    abstract void Delegate(String userTaskId, String delegateTo, String message)
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
    abstract Task<List<UserTask>> GetMyUserTasks(int limit)
    abstract Task<UserTask> GetMyUserTask(string userTaskId)
    abstract Task ClaimUserTask(string userTaskId)
    abstract Task DelayUserTask(string userTaskId, DateTime delayUntil)
    abstract Task Delegate(string userTaskId, string delegateTo, string message)
    abstract Task<List<UserTaskDelegator>> GetMyUserTaskDelegators(string userTaskId, int limit, string offset)
}

abstract class "CamundaAdapter" as CSharpCamundaAdapter implements CSharpRestServer
{
    abstract Task<bool> IsAuthorized(CamundaUserTask userTask)
    abstract Task<UserTask> Map(CamundaUserTask userTask)
    abstract Task<List<UserTaskDelegator>> GetMyUserTaskDelegators(string userTaskId, int limit, string offset)
}

abstract class "ZeebeAdapter" as CSharpZeebeAdapter implements CSharpRestServer
{
    abstract Task<bool> IsAuthorized(CamundaUserTask userTask)
    abstract Task<UserTask> Map(CamundaUserTask userTask)
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


## Commands & queries

[commands & queries](openapi.yaml)

