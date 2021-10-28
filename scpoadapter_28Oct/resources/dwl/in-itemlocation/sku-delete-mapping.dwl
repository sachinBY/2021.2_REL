%dw 2.0
output application/java
---
 (payload map (sku, indexOfsku) -> {
	INTEGRATION_STAMP: sku.INTEGRATION_STAMP,
    (ITEM: sku.ITEM) if not sku.ITEM == null,
    (LOC: sku.LOC) if not sku.LOC == null,
    (vars.deleteudc): 'Y'
  })