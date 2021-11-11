%dw 2.0
output application/java
---
 (payload map (movingEventData, indexOfEvent) -> {
 	INTEGRATION_STAMP: movingEventData.INTEGRATION_STAMP,
    MOVINGEVENT: movingEventData.MOVINGEVENT,
    YEAR: movingEventData.YEAR,
    (vars.deleteudc): 'Y'
  })