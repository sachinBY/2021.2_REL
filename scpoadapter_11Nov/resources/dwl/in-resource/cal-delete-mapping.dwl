%dw 2.0
output application/java  
---
(payload map (calData, indexOfCal) -> {  	  	
	CAL: calData.CAL
    })