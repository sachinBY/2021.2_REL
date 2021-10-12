%dw 2.0
output application/java  
---
(payload map (resource, indexOfresource) -> {  	  	
    RES: resource.RES,
    (vars.deleteudc): 'Y'
    })
