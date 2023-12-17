%dw 2.0
output application/json
var regex = /`([^`]+)`\s*(\w+)\s*(.*)/
---

payload.tables map (item, index) -> {
item: item mapObject (value, key) -> {
     (upper(key)): value
    },

field: (item.columns[0] match regex) default ["", "", ""]
}
