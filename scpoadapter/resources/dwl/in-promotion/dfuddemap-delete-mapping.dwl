%dw 2.0
output application/java
---
(payload map (promotion, promotionIndex) -> {
	    INTEGRATION_STAMP: promotion.INTEGRATION_STAMP,
		DMDUNIT:  promotion.DMDUNIT,
		DMDGROUP:  promotion.DMDGROUP,			  		
		LOC: promotion.LOC,
		MODEL:  promotion.MODEL,
		DDEPROFILEID : promotion.DDEPROFILEID,
		(vars.deleteudc): 'Y'
})
