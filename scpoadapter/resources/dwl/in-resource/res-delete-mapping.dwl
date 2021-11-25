%dw 2.0
output application/java  
---
(payload map (resource, indexOfresource) -> {  	 
	INTEGRATION_STAMP: resource.INTEGRATION_STAMP, 	
    RES: resource.RES,
    (vars.deleteudc): 'Y'
    })
