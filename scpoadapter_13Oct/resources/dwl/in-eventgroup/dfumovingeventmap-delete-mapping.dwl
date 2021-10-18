%dw 2.0
output application/java
---
 (payload map (dfuMovingEventMap, indexOfEvent) -> {
 		INTEGRATION_STAMP: dfuMovingEventMap.INTEGRATION_STAMP,
		DMDUNIT: dfuMovingEventMap.DMDUNIT,
		DMDGROUP: dfuMovingEventMap.DMDGROUP,
		LOC: dfuMovingEventMap.LOC,
		MOVINGEVENT: dfuMovingEventMap.MOVINGEVENT,
		(vars.deleteudc): 'Y'
   
  })