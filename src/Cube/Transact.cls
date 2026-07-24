/// 
Class Cube.Transact Extends %DeepSee.CubeDefinition [ DependsOn = dc.iris.transact, ProcedureBlock ]
{

/// Cube definition from Architect.
XData Cube [ XMLNamespace = "http://www.intersystems.com/deepsee" ]
{
<cube xmlns="http://www.intersystems.com/deepsee" name="Transact" displayName="Transact" disabled="false" abstract="false" sourceClass="dc.iris.transact" namedFactNums="true" countMeasureName="%COUNT" bucketSize="8" bitmapChunkInMemory="false" precompute="0" disableListingGroups="false" enableSqlRestrict="false">
</cube>
}

Parameter DOMAIN;

}
