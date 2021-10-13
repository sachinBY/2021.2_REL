%dw 2.0
output application/java
var default_value = "###JDA_DEFAULT_VALUE###"
---
(payload map (sourcingconv, indexOfsourcingconv) -> {
		DEST: sourcingconv.DEST,
		ITEM: sourcingconv.ITEM,
		SOURCE: sourcingconv.SOURCE,
		SOURCECATEGORY: sourcingconv.SOURCECATEGORY,
		TARGETCATEGORY: sourcingconv.TARGETCATEGORY,
		TRANSMODE: sourcingconv.TRANSMODE,
		(vars.deleteudc): 'Y'
  })