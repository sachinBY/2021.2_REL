%dw 2.0
output application/java
var default_value = "###JDA_DEFAULT_VALUE###"
---
 (payload map (sourcing, indexOfSourcing) -> {
		DEST: sourcing.DEST,
		ITEM: sourcing.ITEM,
		SOURCE: sourcing.SOURCE,
		SOURCING: sourcing.SOURCING,
		(vars.deleteudc): 'Y'
 	 })