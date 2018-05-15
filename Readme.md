# Random Warframe data api

Random set of Warframe data API endpoints that retrieve data from the [warframe wikia.](https://warframe.wikia.com)

### Currently existing API endpoints

| Api url | Description |
| ------- | ----------- |
| /weapons-data | Returns JSON data from the Lua module [Module:Weapons/data](http://warframe.wikia.com/wiki/Module:Weapons/data) |
| /mods-data | Returns JSON data from the Lua module [Module:Mods/data](http://warframe.wikia.com/wiki/Module:Mods/data) |
| /icons-data |Returns JSON data from the Lua module [Module:Icon/data](http://warframe.wikia.com/wiki/Module:Icon/data) |
| /void-data |Returns JSON data from the Lua module [Module:Void/data](http://warframe.wikia.com/wiki/Module:Void/data) |
| /version-data |Returns JSON data from the Lua module [Module:Version/data](http://warframe.wikia.com/wiki/Module:Version/data) |

All of the API endpoints also have a `/meta` route. That route can be used to get the metadata of the latest
data. Example for `/weapons-data` the hash route would be `/weapons-data/meta` and the returned data would be:
```json
{
    "meta": {
        "nRefresh": 1,
        "lastRefresh": 1526372306650,
        "hash": "mKWrCbLQGqqRd9icbLYUOIma77B9D0JMXa3ovH6gVFo="
    }
}
```
This route can be used as a pre-update check to save bandwidth. For example the `/weapons-data` route returns at the time
of writing this 281 KB of data and the `/weapons-data/meta` returns only 297 B of data. Response latency is almost same 
for both of the routes as they do almost same things server side.

> NOTE: The hash can change even if the data hasn't changed! For example server restart will change the hash.

## Returned data

All of the endpoints return JSON data that contains two objects. A data object that contains the module data and a meta 
object that contains some metadata for the data.

Example return for `/weapons-data`:
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
        "hash": "mKWrCbLQGqqRd9icbLYUOIma77B9D0JMXa3ovH6gVFo="
    }
}
```

# Dependencies 

* Lua 5.3
* Node.js 9.9.0 or higher

# License

Licensed under GPL-3.0.