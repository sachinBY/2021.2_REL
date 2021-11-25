%dw 2.0
output application/java
---
(payload map (productionMethod,indexofproductionMethod) -> {
	    INTEGRATION_STAMP: productionMethod.INTEGRATION_STAMP,
		PRODUCTIONMETHOD :  productionMethod.PRODUCTIONMETHOD ,
		ITEM:  productionMethod.ITEM ,
		LOC: productionMethod.LOC,
		(vars.deleteudc): 'Y'	
	})