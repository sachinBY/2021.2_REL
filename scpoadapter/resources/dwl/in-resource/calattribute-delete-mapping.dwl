%dw 2.0
output application/java  
var default_value = "###JDA_DEFAULT_VALUE###"
---
(payload map (cal, indexOfCalAttribute) -> {  	  	
    
    		CAL: cal.CAL,
    		ATTRIBUTE: cal.ATTRIBUTE,
    		(vars.deleteudc): 'Y'		    
    })