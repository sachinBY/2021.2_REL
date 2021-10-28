%dw 2.0
output application/java
---
payload map (planArriv, indexOfplanArriv) -> {
	    INTEGRATION_STAMP: planArriv.INTEGRATION_STAMP,
		ITEM: planArriv.ITEM,
		DEST: planArriv.DEST,
		(vars.deleteudc): 'Y'   
}