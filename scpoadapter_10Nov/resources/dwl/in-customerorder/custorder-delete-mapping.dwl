%dw 2.0
output application/java
var default_value = "###JDA_DEFAULT_VALUE###"
---
 (payload map (customerOrder, indexOfCustomerOrder) -> {
 		INTEGRATION_STAMP: customerOrder.INTEGRATION_STAMP,
		ITEM: customerOrder.ITEM,
		LOC: customerOrder.LOC,
		ORDERID: customerOrder.ORDERID,
		SHIPDATE: customerOrder.SHIPDATE,
		(vars.deleteudc): 'Y'
 	 })