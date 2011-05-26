<g:if test="${container }">
	<div class="action-menu-item">
		<g:link action="createShipment" event="addItemToContainer" params="['container.id':container?.id]">
			<img src="${createLinkTo(dir:'images/icons/silk',file:'add.png')}" alt="Add an item" style="vertical-align: middle"/>&nbsp;
			Add an item
		</g:link> 													
	</div>
	<div class="action-menu-item">
		<g:link action="createShipment" event="editContainer" params="[containerToEditId:container?.id]">
			<img src="${createLinkTo(dir:'images/icons/silk',file:'pencil.png')}" alt="Edit container" style="vertical-align: middle"/>&nbsp;
			Edit ${container?.containerType?.name }
		</g:link> 	
	</div>
	<%-- Only allow one level deep --%> 
	<g:if test="${!container?.parentContainer }">
		<div class="action-menu-item">
			<g:link action="createShipment" event="addBoxToContainer" params="['container.id':container?.id]">
				<img src="${createLinkTo(dir:'images/icons/silk',file:'package_add.png')}" alt="Add a box" style="vertical-align: middle"/>&nbsp;
				Add a box
			</g:link>
		</div>
	</g:if>
	<div class="action-menu-item">
		<g:link action="createShipment" event="deleteContainer" params="['container.id':container?.id]" onclick="return confirm('Are you sure you want to delete this ${selectedContainer?.containerType?.name }?')">
			<img src="${createLinkTo(dir:'images/icons/silk',file:'delete.png')}" alt="Delete container" style="vertical-align: middle"/>&nbsp;
			Delete ${container?.containerType?.name }
		</g:link> 	
	</div>
</g:if>				
<g:else>
	<div class="action-menu-item">
		<g:link action="createShipment" event="addItemToShipment">
			<img src="${createLinkTo(dir:'images/icons/silk',file:'add.png')}" alt="Add an item" style="vertical-align: middle"/>&nbsp;
			Add an item
		</g:link> 													
	</div>
</g:else>							
		