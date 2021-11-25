%dw 2.0
output application/java
---
 (payload map (bom, indexOfBom) -> {
 		 INTEGRATION_STAMP: bom.INTEGRATION_STAMP,
  		 BOMNUM: bom.BOMNUM,
		 EFF: bom.EFF,
		 ITEM: bom.ITEM,
		 LOC: bom.LOC,
		 OFFSET: bom.OFFSET,
		 SUBORD: bom.SUBORD,
		 (vars.deleteudc): 'Y'
 	 })