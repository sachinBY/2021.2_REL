%dw 2.0
output application/java
var default_value = "###JDA_DEFAULT_VALUE###"
---
 (payload map (netcap, indexOfNetcap) -> {
  		UOM: netcap.UOM,
		MINCAP: netcap.MINCAP,
		SOURCE: netcap.SOURCE,
		TRANSMODE: netcap.TRANSMODE,
		DEST: netcap.DEST,
		(vars.deleteudc): 'Y'
 	 })