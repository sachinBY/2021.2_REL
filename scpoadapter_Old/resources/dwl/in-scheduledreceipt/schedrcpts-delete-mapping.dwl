%dw 2.0
output application/json
---
 (payload map (schedReceipt, index) -> {
  	EXPDATE: schedReceipt.EXPDATE,
	ITEM: schedReceipt.ITEM,
	LOC: schedReceipt.LOC,
	SCHEDDATE: schedReceipt.SCHEDDATE,
	SEQNUM: schedReceipt.SEQNUM,
	STARTDATE: schedReceipt.STARTDATE,
	(vars.deleteudc): 'Y'
  })