%dw 2.0
output application/json
---
using (
    sql = "SELECT DISTINCT TMP.QTY AS TMP_QTY, FSTW.* FROM EXP_FCSTNARROW TMP RIGHT OUTER JOIN (SELECT FN.QTY,FN.DUR,FN.STARTDATE AS FN_STARTDATE, FW.* FROM FCSTNARROW FN,FCSTWIDE  FW WHERE FN.DMDUNIT = FW.DMDUNIT AND FN.DMDGROUP = FW.DMDGROUP AND FN.LOC = FW.LOC AND FN.FCSTID = FW.FCSTID AND FN.TYPE = FW.TYPE AND FN.STARTDATE >= to_date(SYSDATE)) FSTW ON TMP.DMDUNIT = FSTW.DMDUNIT AND TMP.DMDGROUP = FSTW.DMDGROUP AND TMP.LOC = FSTW.LOC AND TMP.FCSTID = FSTW.FCSTID AND TMP.TYPE = FSTW.TYPE AND TMP.STARTDATE = FSTW.FN_STARTDATE"
)
if (vars.filterCondition != null)
   sql ++ " WHERE " ++ vars.filterCondition
  else 
  	sql