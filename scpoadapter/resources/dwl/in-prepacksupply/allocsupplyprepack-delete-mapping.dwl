%dw 2.0
output application/java  
---
 (payload map (prepack, index) -> {
 	INTEGRATION_STAMP: prepack.INTEGRATION_STAMP,
    SUPPLYID: prepack.SUPPLYID,
    (vars.deleteudc): 'Y'
  })