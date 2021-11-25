%dw 2.0
output application/java  
var default_value = "###JDA_DEFAULT_VALUE###"
---
 (payload map (itemlocdmdgroup, indexOfItemlocdmdgroup) -> {
		INTEGRATION_STAMP: itemlocdmdgroup.INTEGRATION_STAMP,
	  	DMDGROUP: itemlocdmdgroup.DMDGROUP,
	  
	    ITEM : itemlocdmdgroup.ITEM,
	    LOC : itemlocdmdgroup.LOC,
	    (vars.deleteudc): 'Y'
	   
    
 })