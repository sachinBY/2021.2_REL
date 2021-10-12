%dw 2.0
output application/java  
var skuIOParamEntity = vars.entityMap.sku[0].skuioparam[0]
var lib = readUrl("classpath://config-repo/scpoadapter/resources/dwl/host-scpo-udc-mapping.dwl")
---
(payload.itemLocation map {
 
  ITEM: $.itemLocationId.item.primaryId,
  LOC: $.itemLocationId.location.primaryId,
  AVGRQSNSIZE: $.inventoryOptimizationParameters.averageRequisitionQuantity.value,
  GROUPNAME: $.inventoryOptimizationParameters.groupName,
  NUMRQSN: $.inventoryOptimizationParameters.annualRequisitionNumber,
  REVIEWGROUP: $.inventoryOptimizationParameters.reviewGroup,
  SENSITIVITYPROFILE: $.inventoryOptimizationParameters.sensitivityProfile,
		SkuIOParamUDC:(flatten([(lib.getUdcNameAndValue(skuIOParamEntity, $.avpList, lib.getAvpListMap($.avpList) )[0]) 
	if ($.avpList != null 
		and ($.documentActionCode == "ADD" or $.documentActionCode == "CHANGE_BY_REFRESH")
		and skuIOParamEntity != null
	),
	(lib.getUdcNameAndValue(skuIOParamEntity, $.inventoryOptimizationParameters.avpList, lib.getAvpListMap($.inventoryOptimizationParameters.avpList) )[0]) 
	if ($.inventoryOptimizationParameters.avpList != null 
		and ($.documentActionCode == "ADD" or $.documentActionCode == "CHANGE_BY_REFRESH")
		and skuIOParamEntity != null
	)])),
  ACTIONCODE: $.documentActionCode
})