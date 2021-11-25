%dw 2.0
output application/java
var default_value = "###JDA_DEFAULT_VALUE###"
---
(payload map (sourcingconv, indexOfsourcingconv) -> {
		DEST: sourcingconv.DEST,
		ITEM: sourcingconv.ITEM,
		RATIO: sourcingconv.RATIO,
		SOURCE: sourcingconv.SOURCE,
		SOURCECATEGORY: sourcingconv.SOURCECATEGORY,
		SOURCEUOM: sourcingconv.SOURCEUOM,
		TARGETCATEGORY: sourcingconv.TARGETCATEGORY,
		TARGETUOM: sourcingconv.TARGETUOM,
		TRANSMODE: sourcingconv.TRANSMODE,
		(vars.deleteudc): 'Y'
  })