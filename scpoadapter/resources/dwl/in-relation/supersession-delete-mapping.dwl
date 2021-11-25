%dw 2.0
output application/java  
ns ns0 urn:jda:master:relation:xsd:3
---
 (payload map (relation, indexOfrelation) -> {
 	INTEGRATION_STAMP: relation.INTEGRATION_STAMP,
    (ALTITEM: relation.ALTITEM) if not relation.ALTITEM == null,
    (DISC: relation.DISC) if not relation.DISC == null,
	(DMDGROUP: relation.DMDGROUP) if not relation.DMDGROUP == null,
	(EFF: relation.EFF) if not relation.EFF == null,
	(ITEM: relation.ITEM) if not relation.ITEM == null,
	(LOC: relation.LOC) if not relation.LOC == null,
	(vars.deleteudc): 'Y'
  })