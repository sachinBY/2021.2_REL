%dw 2.0
output application/json
---
 (payload map (schedReceiptDetail, index) -> {
  	EXPDATE: schedReceiptDetail.EXPDATE,
	ITEM: schedReceiptDetail.ITEM,
	LOC: schedReceiptDetail.LOC,
	SCHEDDATE: schedReceiptDetail.SCHEDDATE,
	SEQNUM: schedReceiptDetail.SEQNUM,
	STARTDATE: schedReceiptDetail.STARTDATE,
	STEPNUM: schedReceiptDetail.STEPNUM,
	(vars.deleteudc): 'Y'
  })