%dw 2.0
output application/java  
ns ns0 urn:jda:master:demand_unit:xsd:3
---
 (payload map (dmdunit, indexOfdmdunit) -> {
    (DMDUNIT: dmdunit.DMDUNIT) if not dmdunit.DMDUNIT == null,
    (vars.deleteudc): 'Y'
  })