%dw 2.0
output application/java
---
payload map(dynamicDeploymentSourcing, dynamicDeploymentSourcingIndex) -> {
	
	INTEGRATION_STAMP: dynamicDeploymentSourcing.INTEGRATION_STAMP,
	DEST:dynamicDeploymentSourcing.DEST,
	
	EFF:dynamicDeploymentSourcing.EFF,
	ITEM:dynamicDeploymentSourcing.ITEM,
	
	SOURCE:dynamicDeploymentSourcing.SOURCE,
	
		
	TRANSMODE:dynamicDeploymentSourcing.TRANSMODE,
	(vars.deleteudc): 'Y'

		
	  
		
}
