# Random Warframe data api

Random set of Warframe data API endpoints that retrieve data from the [Warframe Wiki.](https://warframe.fandom.com/)
If you use this service and notice that there is data missing please contribute to the Warframe Wiki. The data you
contribute will be included in responses within one hour of the update of data at the Wikia.

# Use of service

The API is currently hosted on url `http://wf.snekw.com`. Anyone is free to use the endpoint or host this project themselves.
The `http://wf.snekw.com` endpoint is NOT guaranteed to be available all of the time! It is running on my own testing server
that may sometimes go down because of other things thar are running on it. If the service is down, please notify me.

### Currently existing API endpoints

| Api url | Module |
| ------- | ----------- |
| /weapons-wiki |  [Module:Weapons/data](http://warframe.wikia.com/wiki/Module:Weapons/data) |
| /mods-wiki |  [Module:Mods/data](http://warframe.wikia.com/wiki/Module:Mods/data) |
| /icon-wiki | [Module:Icon/data](http://warframe.wikia.com/wiki/Module:Icon/data) |
| /void-wiki | [Module:Void/data](http://warframe.wikia.com/wiki/Module:Void/data) |
| /version-wiki | [Module:Version/data](http://warframe.wikia.com/wiki/Module:Version/data) |
| /warframes-wiki | [Module:Warframes/data](http://warframe.wikia.com/wiki/Module:Warframes/data) |
| /warframesConclave-wiki | [Module:Warframes/Conclave/data](http://warframe.wikia.com/wiki/Module:Warframes/Conclave/data) |
| /ability-wiki | [Module:Ability/data](http://warframe.wikia.com/wiki/Module:Ability/data) |
| /focus-wiki | [Module:Focus/data](http://warframe.wikia.com/wiki/Module:Focus/data) |
| /missions-wiki | [Module:Missions/data](http://warframe.wikia.com/wiki/Module:Missions/data) |
| /research-wiki | [Module:Research/data](http://warframe.wikia.com/wiki/Module:Research/data) |
| /arcane-wiki | [Module:Arcane/data](http://warframe.wikia.com/wiki/Module:Arcane/data) |
| /syndicates-wiki | [Module:Syndicates/data](http://warframe.wikia.com/wiki/Module:Syndicates/data) |

> NOTE: For most up to date API info see [http://wf.snekw.com](http://wf.snekw.com)!

All of the API endpoints also have a `/meta` route. That route can be used to get the metadata of the latest
data. Example for `/weapons-wiki` the hash route would be `/weapons-wiki/meta` and the returned data would be:
```json
{
    "meta": {
        "nRefresh": 1,
        "lastRefresh": 1526372306650,
        "hash": "mKWrCbLQGqqRd9icbLYUOIma77B9D0JMXa3ovH6gVFo=",
        "license": "CC BY-SA"
    }
}
```
This route can be used as a pre-update check to save bandwidth. For example the `/weapons-data` route returns at the time
of writing this 281 KB of data and the `/weapons-data/meta` returns only 297 B of data. Response latency is almost same 
for both of the routes as they do almost same things server side.

> NOTE: The hash can change even if the data hasn't changed! For example server restart will change the hash.

## *-wiki endpoints 

*-wiki endpoints return JSON data that contains two objects. A data object that contains the module data and a meta 
object that contains some metadata for the data. All of the data from these urls is from the [Warframe Wikia](https://warframe.wikia.com)
and is under a [CC BY-SA](https://creativecommons.org/licenses/by-sa/2.0/) license.

Example return for `/weapons-wiki`:
```json
{
    "data": {
      "Augments": [{}, {}],
      "IgnoreInCount": ["", ""],
      "Stances": [{}, {}],
      "Weapons": [{}, {}]
    },
    "meta": {
        "nRefresh": 1,
        "lastRefresh": 1526372306650,
        "hash": "mKWrCbLQGqqRd9icbLYUOIma77B9D0JMXa3ovH6gVFo=",
        "license": "CC BY-SA"
    }
}
```

## Headers

All of the request contain a `X-Api-Version` header that is the short version of the latest commit hash that is running
on the server. If for some reason the server isn't yet running the latest version you can see it by comparing the version
header.

## Errors

If an error occurs during a request the server will return with a response which status is not `200` and the response body
will look like this:
```json
{
  "error": {
    "data": {},
    "inner": {},
    "message": ""
  }
}
```
The `inner` object contains any errors that happened before the error the top most error. It can contain an inner error 
itself.

If the server is running with in other mode than production node environment then a stack trace and full error object
will also be included.
In any normal API use cases the stack trace and full error object will both be excluded.

# Dependencies 

* Lua 5.3
* Node.js 9.9.0 or higher

# Source

https://github.com/Snekw/Wf

# License

The source code is licensed under GPL-3.0.

All of the Warframe data is from [Warframe Wiki](https://warframe.fandom.com/) and is licensed under CC BY-SA license.