%dw 2.0
output application/java
---
(payload map (calendarAttribute, calendarAttributeIndex) -> {
	//How to mitigate 
	CAL: calendarAttribute.CAL,
	ATTRIBUTE: calendarAttribute.ATTRIBUTE,
	(vars.deleteudc): 'Y'
})
