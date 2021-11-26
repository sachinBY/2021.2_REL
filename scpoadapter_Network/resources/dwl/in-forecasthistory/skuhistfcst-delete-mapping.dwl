%dw 2.0
output application/java
---
(flatten(payload.data) map(fcstHist, index) -> {
	INTEGRATION_STAMP: fcstHist.INTEGRATION_STAMP,
	(ITEM: fcstHist.ITEM),
	(LOC: fcstHist.LOC),
	FCSTDATE: fcstHist.FCSTDATE,
	STARTDATE: fcstHist.STARTDATE,
	DUR: fcstHist.DUR,
	(vars.deleteudc): 'Y'
})