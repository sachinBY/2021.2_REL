%dw 2.0
output application/java
---
(payload map (promotion, promotionIndex) -> {
	    INTEGRATION_STAMP: promotion.INTEGRATION_STAMP,
		DESCR : promotion.DESCR,
		DMDUNIT:  promotion.DMDUNIT,
		DMDGROUP:  promotion.DMDGROUP,			  		
		LOC: promotion.LOC,
		MODEL:  promotion.MODEL,
		(vars.deleteudc): 'Y'
})
