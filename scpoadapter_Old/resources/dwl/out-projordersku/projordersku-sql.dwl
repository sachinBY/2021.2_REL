%dw 2.0
output application/java
---
if(vars.filterCondition != null)
	"SELECT PROJORDERSKU.*,ITEM.UOM FROM PROJORDERSKU,ITEM WHERE PROJORDERSKU.ITEM = ITEM.ITEM" ++ " AND " ++ vars.filterCondition
else	
	"SELECT PROJORDERSKU.*,ITEM.UOM FROM PROJORDERSKU,ITEM WHERE PROJORDERSKU.ITEM = ITEM.ITEM"