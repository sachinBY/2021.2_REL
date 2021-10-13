%dw 2.0
output application/java
---
 (payload distinctBy $.MOVINGEVENT map (movingEvent, indexOfEvent) -> {
 	INTEGRATION_STAMP: movingEvent.INTEGRATION_STAMP,
    MOVINGEVENT: movingEvent.MOVINGEVENT,
    (vars.deleteudc): 'Y'
  })