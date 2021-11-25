%dw 2.0
output application/java  
---
(payload map (tranmodeeqp, indexOftransmodeeqp) -> {
	INTEGRATION_STAMP: tranmodeeqp.INTEGRATION_STAMP,
    (TRANSMODE: tranmodeeqp.TRANSMODE) if not tranmodeeqp.TRANSMODE == null,
    (vars.deleteudc): 'Y'
 })