%dw 2.0
output application/java
---
(payload map (purchMethod, indexOfPurchMethod) -> {
	    INTEGRATION_STAMP: purchMethod.INTEGRATION_STAMP,
  		(PURCHMETHOD: purchMethod.PURCHMETHOD) if not purchMethod.PURCHMETHOD == null,
		(ITEM: purchMethod.ITEM )if not purchMethod.ITEM == null,
		(LOC: purchMethod.LOC) if not purchMethod.LOC == null,
		(vars.deleteudc): 'Y'
	  })