Class otw.iris.production Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="otw.iris.production" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="EnsLib.File.PassthroughService" Category="" ClassName="EnsLib.File.PassthroughService" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Adapter" Name="ArchivePath">/opt/irisapp/archive/</Setting>
    <Setting Target="Adapter" Name="FilePath">/opt/irisapp/inbox/</Setting>
    <Setting Target="Adapter" Name="WorkPath">/opt/irisapp/archive/</Setting>
    <Setting Target="Host" Name="TargetConfigNames">otw.iris.bpl</Setting>
  </Item>
  <Item Name="otw.iris.bpl" Category="" ClassName="otw.iris.bpl" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
  </Item>
</Production>
}

}
