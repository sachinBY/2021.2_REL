%dw 2.0
output application/java
var default_value = "###JDA_DEFAULT_VALUE###"
---
 (payload map (relation, indexOfRelation) -> {
	    INTEGRATION_STAMP: relation.INTEGRATION_STAMP,
		ACTION_GROUP_SET_ID: relation.ACTION_GROUP_SET_ID,
		ACTION_NUMBER: relation.ACTION_NUMBER,
		FROMDISCDATE: relation.FROMDISCDATE,
		FROMHISTSTART: relation.FROMHISTSTART,
		REQUESTID: relation.REQUESTID,
		TODISCDATE: relation.TODISCDATE,
		TOEFFDATE: relation.TOEFFDATE,
		TONPIINDDATE: relation.TONPIINDDATE,
		TONPISCALINGFACTOR: relation.TONPISCALINGFACTOR,
		HISTSTREAM: relation.HISTSTREAM,
		FROMDMDGROUP: relation.FROMDMDGROUP,
		TODMDGROUP: relation.TODMDGROUP,
		FROMDMDUNIT: relation.FROMDMDUNIT,
		TODMDUNIT: relation.TODMDUNIT,
		FROMLOC: relation.FROMLOC,
		TOLOC: relation.TOLOC,
		FROMMODEL: relation.FROMMODEL,
		TOMODEL: relation.TOMODEL,
	 	(relation.udcs map {
			(($.scpoColumnName): if ($.scpoColumnValue == null or $.scpoColumnValue == default_value) default_value
								else if ($.dataType != null and $.dataType == "DATETIME") $.scpoColumnValue as DateTime as String
								else if ($.dataType != null and $.dataType == "DATE") $.scpoColumnValue as Date {format: "yyyy-MM-dd", class : "java.sql.Date"}
								else if ($.dataType != null and ($.dataType == "NUMBER" or $.dataType == "FLOAT" or $.dataType == "INTEGER")) $.scpoColumnValue as Number
								else $.scpoColumnValue) if ($ != null and $.scpoColumnName != null)
			}),
		(relation.avplistUDCS default [] map {
	      		(($.UDCName): if ($.UDCValue == null or $.UDCValue == default_value) default_value
								else if ($.dataType != null and $.dataType == "DATETIME") $.UDCValue as DateTime as String
								else if ($.dataType != null and $.dataType == "DATE") $.UDCValue as Date {format: "yyyy-MM-dd", class : "java.sql.Date"}
								else if ($.dataType != null and ($.dataType == "NUMBER" or $.dataType == "FLOAT" or $.dataType == "INTEGER")) $.UDCValue as Number
								else $.UDCValue) if ($ != null and $.UDCName != null)
	    	})
    	
 	 })