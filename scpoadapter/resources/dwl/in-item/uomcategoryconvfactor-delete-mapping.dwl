%dw 2.0
output application/java
var default_value = "###JDA_DEFAULT_VALUE###"
---
(payload map (uomCategoryConvFactor, indexOfUomCategoryConvFactor) -> {
		ITEM: uomCategoryConvFactor.ITEM,
		SOURCECATEGORY: uomCategoryConvFactor.SOURCECATEGORY,
		TARGETCATEGORY: uomCategoryConvFactor.TARGETCATEGORY,
		(vars.deleteudc): 'Y'
  })