%dw 2.0
output application/java  
---
 (payload map (calPattern, indexOfCal) -> {  	  	
    CAL: calPattern.CAL,
    (vars.deleteudc): 'Y'
    })
