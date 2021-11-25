%dw 2.0
output application/java
---
(payload map (calendar, calendarIndex) -> {
	CAL: calendar.CAL,
	(vars.deleteudc): 'Y'
})
