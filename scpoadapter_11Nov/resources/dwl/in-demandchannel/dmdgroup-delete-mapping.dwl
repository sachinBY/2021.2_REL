%dw 2.0
output application/java  
---
(payload map (dmdgroup, indexOfDmdgroup) -> {
	INTEGRATION_STAMP: dmdgroup.INTEGRATION_STAMP,
    DMDGROUP: dmdgroup.DMDGROUP,
    (vars.deleteudc): 'Y'
  })