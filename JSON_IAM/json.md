###  Authentication:
* it's used to  permissions for the user will allow with credentials 
### Authorization:
* we have some restrictions when access into the aws account

### JSON

* JSON is all about representing data in name value pairs
* Each name value pair will have following syntax

    "<name>" : <value>

* simple type
  number
  boolian
  complex

```
version: "fixed"

Prinicipal: This represents user

statement: single/ multiple

    effect: allow/deny

    action: which resource added to your effect

    Condition: Execute the permission based on some condition
     
    action: This defines the activities that can be done on resource

    resource: for where  you want to apply that permission trough arn (amazon  resource name)
    Resource: This represents a resoruce (ARN)

     arn:aws:<resouce-name>:<region>:<account-id>: <sub resources-name>
    
    these resources are single or multiple

              
