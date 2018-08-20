# Http Methods
> POST - create resource
> PUT - creates/replaces the resource - new db id after...
> PATCH - updates part of the resource

[POST PUT PATCH](https://stackoverflow.com/questions/630453/put-vs-post-in-rest/630475#2590281)
[stackoverflow explanation](https://stackoverflow.com/questions/31089221/what-is-the-difference-between-put-post-and-patch)

[Difference between PATCH and PUT](https://stackoverflow.com/questions/21660791/what-is-the-main-difference-between-patch-and-put-request)
[gist API - good examples](https://developer.github.com/v3/gists/#create-a-gist)

## POST (Create)
> can be used when a client is sending data to the server and the server will decide the URI for the newly created resource.  The POST method can be used to request that the origin server accept the entity enclosed in the request as a new subordinate of the resource identified by the Request-URI in the Request-Line.

## GET (Read)

## PUT (Update)
> PUT is idempotent, so if you PUT an object twice, it has no effect. This is a nice property, so I would use PUT when possible.

## PATCH ()
> Patch request says that we would only send the data that we need to modify without modifying or effecting other parts of the data. Ex: if we need to update only the first name, we pass only the first name

> With PATCH, however, the enclosed entity contains a set of instructions describing how a resource currently residing on the origin server should be modified to produce a new version. The PATCH method affects the resource identified by the Request-URI, and it also MAY have side effects on other resources; i.e., new resources may be created, or existing ones modified, by the application of a PATCH.

> The PATCH method requests that a set of changes described in the request entity be applied to the resource identified by the Request- URI. The set of changes is represented in a format called a "patch document" identified by a media type. If the Request-URI does not point to an existing resource, the server MAY create a new resource, depending on the patch document type (whether it can logically modify a null resource) and permissions, etc.

> The difference between the PUT and PATCH requests is reflected in the way the server processes the enclosed entity to modify the resource identified by the Request-URI. In a PUT request, the enclosed entity is considered to be a modified version of the resource stored on the origin server, and the client is requesting that the stored version be replaced.

## DELETE (Delete)


# REST APIs
[odin api dev](https://www.theodinproject.com/courses/ruby-on-rails/lessons/apis-and-building-your-own)
[beginners guide to REST API](http://www.andrewhavens.com/posts/20/beginners-guide-to-creating-a-rest-api/)
[Learn REST: A Tutorial](http://rest.elkstein.org)
