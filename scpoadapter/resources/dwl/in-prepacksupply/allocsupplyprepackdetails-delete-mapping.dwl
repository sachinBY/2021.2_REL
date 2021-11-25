%dw 2.0
output application/java
---
payload map (value,index) -> {
	INTEGRATION_STAMP: value.INTEGRATION_STAMP,
	ITEM: value.ITEM,
	LOC: value.LOC,
	SUPPLYID: value.SUPPLYID,
	(vars.deleteudc): 'Y'
}