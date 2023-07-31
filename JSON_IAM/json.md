
* JSON is all about representing data in name value pairs
* Each name value pair will have following syntax

    "<name>" : <value>

* simple type
  number
  boolian
  complex

```
version: "fixed"
statement: single/ multiple
    effect: allow/deny
    allow: which resource added to your effect 
    resource: for where  you want to apply that permission trough arn (amazon  resource name)
     arn:aws:<resouce-name>:<region>:<account-id>: <sub resources-name>
    
    these resources are single or multiple
              
