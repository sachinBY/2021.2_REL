%dw 2.0
output application/java
var default_value = "###JDA_DEFAULT_VALUE###"



---
(payload map (histTrans, indexOfHistTrans) -> {
			
		INTEGRATION_STAMP: histTrans.INTEGRATION_STAMP,		
		DEST: histTrans.DEST,

		ITEM: histTrans.ITEM,

		ORDERID: histTrans.ORDERID,

		PLANDATE: histTrans.PLANDATE,

		SCHEDARRIVDATE: histTrans.SCHEDARRIVDATE,

		SCHEDQTY: histTrans.SCHEDQTY,

		SCHEDSHIPDATE: histTrans.SCHEDSHIPDATE,

		SOURCE: histTrans.SOURCE,

		TRANSMODE: 	histTrans.TRANSMODE,
		
		  		
				(histTrans.udcs map {
				(($.scpoColumnName): if ($.scpoColumnValue == null or $.scpoColumnValue == default_value) default_value
								else if ($.dataType != null and $.dataType == "DATETIME") $.scpoColumnValue as DateTime as String
								else if ($.dataType != null and $.dataType == "DATE") $.scpoColumnValue as Date {format: "yyyy-MM-dd", class : "java.sql.Date"}
								else if ($.dataType != null and ($.dataType == "NUMBER" or $.dataType == "FLOAT" or $.dataType == "INTEGER")) $.scpoColumnValue as Number
								else $.scpoColumnValue) if($ != null and $.scpoColumnName != null)
				}),
				(histTrans.HistTransUDC default [] map {
	      		(($.UDCName): if ($.UDCValue == null or $.UDCValue == default_value) default_value
								else if ($.dataType != null and $.dataType == "DATETIME") $.UDCValue as DateTime as String
								else if ($.dataType != null and $.dataType == "DATE") $.UDCValue as Date {format: "yyyy-MM-dd", class : "java.sql.Date"}
								else if ($.dataType != null and ($.dataType == "NUMBER" or $.dataType == "FLOAT" or $.dataType == "INTEGER")) $.UDCValue as Number
								else $.UDCValue) if($ != null and $.UDCName != null)
	    		})
		    
 	 	})