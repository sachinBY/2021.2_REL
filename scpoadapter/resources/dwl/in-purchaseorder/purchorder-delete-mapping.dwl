%dw 2.0
output application/java  
---
 (payload map (order, orderseqNum) -> {
 	INTEGRATION_STAMP: order.INTEGRATION_STAMP,
    ORDERNUM: order.ORDERNUM,
    LINENUM: order.LINENUM,
    (vars.deleteudc): 'Y'
  })