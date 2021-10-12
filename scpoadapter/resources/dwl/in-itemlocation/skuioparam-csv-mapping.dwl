%dw 2.0
output application/java
var default_value = "###JDA_DEFAULT_VALUE###"
var lib = readUrl("classpath://config-repo/scpoadapter/resources/dwl/host-scpo-udc-mapping.dwl")
var skuIOParamEntity = vars.entityMap.sku[0].skuioparam[0]
---
(payload map {
	udcs:((skuIOParamEntity map (value, index) -> {
			scpoColumnName: value.scpoColumnName,
			scpoColumnValue: if (lib.mapHostToSCPO($, (value.hostColumnName splitBy "/"), 0) != null and trim(lib.mapHostToSCPO($, (value.hostColumnName splitBy "/"), 0)) != '') (lib.mapHostToSCPO($, (value.hostColumnName splitBy "/"), 0)) else default_value,
			(dataType: value.dataType) if ((lib.mapHostToSCPO($, (value.hostColumnName splitBy "/"), 0)) != null),
	}) filter sizeOf($) > 0),
	ITEM: $."itemLocationId.item.primaryId",
	LOC: $."itemLocationId.location.primaryId",
	AVGRQSNSIZE: $."inventoryOptimizationParameters.averageRequisitionQuantity.value",
	GROUPNAME: $."inventoryOptimizationParameters.groupName",
	NUMRQSN: $."inventoryOptimizationParameters.annualRequisitionNumber",
	REVIEWGROUP: $."inventoryOptimizationParameters.reviewGroup",
	SENSITIVITYPROFILE: $."inventoryOptimizationParameters.sensitivityProfile",
	ACTIONCODE: if ($.documentActionCode != null and !isEmpty($.documentActionCode)) $.documentActionCode else vars.bulknotificationHeaders.documentActionCode
})