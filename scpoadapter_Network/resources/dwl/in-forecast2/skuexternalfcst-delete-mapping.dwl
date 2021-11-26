%dw 2.0
output application/java
---
payload map (forecast, indexOfForecast) -> {
	INTEGRATION_STAMP: forecast.INTEGRATION_STAMP,
	(ITEM: forecast.ITEM),
	(LOC: forecast.LOC) ,
	(STARTDATE: forecast.STARTDATE),
	(PROJECT: forecast.PROJECT),
	(vars.deleteudc): 'Y' 
}