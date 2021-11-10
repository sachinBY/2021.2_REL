%dw 2.0
output application/java
var default_value = "###JDA_DEFAULT_VALUE###"
---
 (payload map (sourcingreq, indexOfSourcingReq) -> {
			DEST: sourcingreq.DEST,
			EFF: sourcingreq.EFF,
			ITEM: sourcingreq.ITEM,
			RATE: sourcingreq.RATE,
			RES: sourcingreq.RES,
			SOURCE: sourcingreq.SOURCE,
			SOURCING: sourcingreq.SOURCING,
			STEPNUM: sourcingreq.STEPNUM,
			(vars.deleteudc): 'Y'
			
 	 })