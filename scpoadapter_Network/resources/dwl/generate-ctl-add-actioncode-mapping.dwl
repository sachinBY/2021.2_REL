%dw 2.0
output text/plain
var keys = vars.headers
var columns = (keys map (key , index) -> 
	{'key': if(key == 'INTEGRATION_STAMP')
		key ++ "\" TO_DATE(SUBSTR(:" ++ key ++ ",1,19), 'YYYY/MM/DD HH24:MI:SS')\""
		else if(vars.metadata.columns[key]['DATA_TYPE'] == 'DATE' and !isEmpty(vars.metadata.columns[key]['DATA_TYPE'])) 
		key ++ "\" TO_DATE(SUBSTR(:" ++ key ++ ",1,10), 'YYYY/MM/DD')\"" else if(vars.metadata.columns[key]['DATA_DEFAULT'] != null and vars.metadata.columns[key]['DATA_TYPE'] == 'VARCHAR2') key ++ " " ++ "\"nvl(:" ++ key ++ ", '" ++ vars.metadata.columns[key]['DATA_DEFAULT'] ++ "')\"" else key
	}
).*key joinBy (',')
---
"options(skip = 1, errors=999999999," ++ "bindsize=" ++ p("sqlldr.bindsize") ++ ",readsize=" ++ p("sqlldr.readsize") ++", parallel=true) load data infile '" ++ (vars.addCSVPath) ++ "' " ++ (if (not (server.osName startsWith 'Windows')) "\"STR x'0D'\"" else "") ++ " append into table " ++ p('scpo.schema.staging.' ++ lower(vars.tableName) ++ '.insert') ++ " fields terminated by ',' optionally enclosed by '\"' TRAILING NULLCOLS (" ++ columns ++ ")"