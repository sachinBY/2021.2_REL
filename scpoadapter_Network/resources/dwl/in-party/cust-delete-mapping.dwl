%dw 2.0
output application/java  
var default_value = "###JDA_DEFAULT_VALUE###"
---
(payload map (cust, indexOfCust) -> {
	INTEGRATION_STAMP: cust.INTEGRATION_STAMP,
  	CUST: if (cust.CUST != null) cust.CUST else default_value,
  	(vars.deleteudc): 'Y'
  })