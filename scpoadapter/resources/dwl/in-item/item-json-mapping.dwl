%dw 2.0
output application/java
var default_value = "###JDA_DEFAULT_VALUE###"
var itemEntity = vars.entityMap.item[0].item[0]
var lib = readUrl("classpath://config-repo/scpoadapter/resources/dwl/host-scpo-udc-mapping.dwl")

import * from dw::Runtime
---
(payload.item map (itm , index) -> {

	(DEFAULTUOM: (if ( vars.uomShortLabels[itm.tradeItemBaseUnitOfMeasure][0] != null ) vars.uomShortLabels[itm.tradeItemBaseUnitOfMeasure][0] as Number
  		else default_value)) 
  		if (itm.tradeItemBaseUnitOfMeasure != null and (itm.documentActionCode == "ADD" or itm.documentActionCode == "CHANGE_BY_REFRESH")),
	DESCR: if (!isEmpty(itm.description filter ($.descriptionType == 'ITEM_NAME'))) (itm.description filter ($.descriptionType == 'ITEM_NAME')).value[0] else default_value,
	DISCRETESW: if ( itm.operationalRules.isDiscrete != null and itm.operationalRules.isDiscrete == true ) 1 else default_value,
	ITEM: itm.itemId.primaryId,
	ITEMCLASS: if ( itm.classifications.itemClass != null ) itm.classifications.itemClass else default_value,
	PERISHABLESW: if (!isEmpty(itm.classifications.handlingInstruction filter (itm.handlingInstructionCode == 'PER'))) 1 else default_value,
	PRIORITY: if ( itm.priority != null ) itm.priority else default_value,
	STORAGEGROUP: if ( itm.classifications.itemFamilyGroup != null ) itm.classifications.itemFamilyGroup else default_value,
	UNITSPERPALLET: if ( itm.itemLogisticUnitInformation.itemLogisticUnit.packageCodeType == "PX" and itm.itemLogisticUnitInformation.itemLogisticUnit.tradeItemQuantity.value != null ) itm.itemLogisticUnitInformation.itemLogisticUnit.tradeItemQuantity.value else default_value,
	UOM: if ( vars.uomShortLabels[itm.tradeItemBaseUnitOfMeasure][0] == null ) default_value
  		else vars.uomShortLabels[itm.tradeItemBaseUnitOfMeasure][0],
	VOL: if ( itm.tradeItemMeasurements.inBoxCubeDimension.value != null ) itm.tradeItemMeasurements.inBoxCubeDimension.value else default_value,
	WGT: if ( itm.tradeItemMeasurements.tradeItemWeight.grossWeight.value != null ) itm.tradeItemMeasurements.tradeItemWeight.grossWeight.value else default_value,
	(avplistUDCS: (lib.getUdcNameAndValue(itemEntity, itm.avpList, lib.getAvpListMap(itm.avpList))[0])) if (itm.avpList != null and (itm.documentActionCode == "ADD" or itm.documentActionCode == "CHANGE_BY_REFRESH") and itemEntity != null),
	ACTIONCODE: itm.documentActionCode
})
