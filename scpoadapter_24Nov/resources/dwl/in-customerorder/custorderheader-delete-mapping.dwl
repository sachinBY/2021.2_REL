%dw 2.0
output application/java
var default_value = "###JDA_DEFAULT_VALUE###"
---
 (payload map (custOrderHeader, indexOfCustOrderHeader) -> {
 		INTEGRATION_STAMP: custOrderHeader.INTEGRATION_STAMP,
		CUST: custOrderHeader.CUST,
		EXTREF: custOrderHeader.EXTREF,
		(vars.deleteudc): 'Y'
    })