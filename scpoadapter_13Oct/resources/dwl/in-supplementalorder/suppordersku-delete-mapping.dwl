%dw 2.0
output application/java
---
 (payload map (suppOrder, indexOfsku) -> {
    (ITEM: suppOrder.ITEM) if not suppOrder.ITEM == null,
    (LOC: suppOrder.LOC) if not suppOrder.LOC == null,
    (vars.deleteudc): 'Y'
  })