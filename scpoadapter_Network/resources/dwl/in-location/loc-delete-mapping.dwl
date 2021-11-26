%dw 2.0
output application/java
---
(payload map (loc, indexOfLoc) -> {
	INTEGRATION_STAMP: loc.INTEGRATION_STAMP,
    (LOC: loc.LOC) if not loc.LOC == null,
    (vars.deleteudc): 'Y'
  })