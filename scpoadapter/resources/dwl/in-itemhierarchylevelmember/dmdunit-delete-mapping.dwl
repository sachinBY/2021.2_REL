%dw 2.0
output application/java  
---
 (payload map (dmdunit, indexOfdmdunit) -> {
	INTEGRATION_STAMP: dmdunit.INTEGRATION_STAMP,
    (DMDUNIT: dmdunit.DMDUNIT) if not dmdunit.DMDUNIT == null,
    (DESCR: dmdunit.DESCR) if not dmdunit.DESCR == null,
    (HIERARCHYLEVEL: dmdunit.HIERARCHYLEVEL) if not dmdunit.HIERARCHYLEVEL == null,
    (vars.deleteudc): 'Y'
  })