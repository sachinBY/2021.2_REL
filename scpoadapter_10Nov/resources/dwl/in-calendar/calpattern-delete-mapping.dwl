%dw 2.0
output application/java
---
(payload map (calendarPattern, calendarPatternPatternIndex) -> {
	//How to mitigate pattern sequence number
	CAL: calendarPattern.CAL,
	(vars.deleteudc): 'Y' 
})
