%dw 2.0
output application/java
var default_value = "###JDA_DEFAULT_VALUE###"
var skuSafetyStockParamEntity = vars.entityMap.sku[0].skusafetystockparam[0]
var lib = readUrl("classpath://config-repo/scpoadapter/resources/dwl/host-scpo-udc-mapping.dwl")
---
(payload map {
	udcs:((skuSafetyStockParamEntity map (value, index) -> {
			scpoColumnName: value.scpoColumnName,
			scpoColumnValue: if (lib.mapHostToSCPO($, (value.hostColumnName splitBy "/"), 0) != null and trim(lib.mapHostToSCPO($, (value.hostColumnName splitBy "/"), 0)) != '') (lib.mapHostToSCPO($, (value.hostColumnName splitBy "/"), 0)) else default_value,
			(dataType: value.dataType) if ((lib.mapHostToSCPO($, (value.hostColumnName splitBy "/"), 0)) != null),
		}) filter sizeOf($) > 0),
	(INTEGRATION_STAMP:((vars.creationDateAndTime as DateTime) + ("PT$(($$))S" as Period)) as String{format:"yyyy-MM-dd HH:mm:ss"}),
	ITEM: $."itemLocationId.item.primaryId",
	LOC: $."itemLocationId.location.primaryId",
	MAXSS: $."safetyStockParameters.maximumSafetyStock.value",
	MINSS: $."safetyStockParameters.minimumSafetyStock.value",
	SSCOV: $."safetyStockParameters.safetyStockCoverageDuration.value",
	STATSSCSL: $."safetyStockParameters.safetyStockCustmerServiceLevel",
	ACCUMDUR: $."safetyStockParameters.accumulationDuration.value",
	AVGLEADTIME: $."safetyStockParameters.averageReplenishmentLeadDuration",
	SSRULE: $."safetyStockParameters.safetyStockRuleCode",
	ACTIONCODE: if ($.documentActionCode != null and !isEmpty($.documentActionCode)) $.documentActionCode else vars.bulknotificationHeaders.documentActionCode
})