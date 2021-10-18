%dw 2.0
output application/java
var default_value = "###JDA_DEFAULT_VALUE###"
---
 (payload map (repnet, indexOfRepnet) -> {
	TRANSMODE: repnet.TRANSMODE,
	SOURCE: repnet.SOURCE,
	DEST: repnet.DEST,
	TRANSLEADTIME: repnet.TRANSLEADTIME,
	LOADTIME: repnet.LOADTIME,
	RANK: repnet.RANK,
	RATEPERCWT: repnet.RATEPERCWT,
	UNLOADTIME: repnet.UNLOADTIME,
	ORDERCOST: repnet.ORDERCOST,
	SHIPCAL: repnet.SHIPCAL,
	ARRIVCAL: repnet.ARRIVCAL,
	ORDERREVIEWCAL: repnet.ORDERREVIEWCAL,
	LEADTIMEEFFCNCYCAL: repnet.LEADTIMEEFFCNCYCAL,
	(vars.deleteudc): 'Y'
 	 })