%dw 2.0
output application/java
---
(payload map (vehicleLoad, indexOfVehicleLoad) -> {
	LOADID: vehicleLoad.LOADID,
	(vars.deleteudc): 'Y'
  })