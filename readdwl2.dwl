%dw 2.0
output application/json
var regex = /`([^`]+)`\s*(\w+)\s*(.*)/

---
payload.tables map (table,index) -> {
    (table.name): [
   //     table.columns

         (table.columns[0] match regex) default ["", "", ""]
    ]
}
