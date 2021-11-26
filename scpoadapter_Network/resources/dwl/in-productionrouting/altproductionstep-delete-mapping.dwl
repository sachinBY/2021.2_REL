%dw 2.0
output application/java
var default_value = "###JDA_DEFAULT_VALUE###"
---
(payload map(productionStep, indexofproductionStep) -> {
	INTEGRATION_STAMP: productionStep.INTEGRATION_STAMP,
	ITEM: productionStep.ITEM,
	LOC: productionStep.LOC,
	PRODUCTIONMETHOD: productionStep.PRODUCTIONMETHOD,
	PRIMARYSTEPNUM: productionStep.PRIMARYSTEPNUM,
	ALTRES: productionStep.ALTRES,
	EFF: default_value,
	(vars.deleteudc): 'Y'
})