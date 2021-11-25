%dw 2.0
output application/java
---
 (flatten(payload) map (sku, indexOfsku) -> {
 	INTEGRATION_STAMP: sku.INTEGRATION_STAMP,
    (ITEM: sku.ITEM) if not sku.ITEM == null,
    (SKULOC: sku.SKULOC) if not sku.SKULOC == null,
	(DMDGROUP: sku.DMDGROUP) if not sku.DMDGROUP == null,
	(vars.deleteudc): 'Y'
  })