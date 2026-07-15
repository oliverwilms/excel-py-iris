Class otw.iris.logger Extends %Persistent
{

Index RequestTimestampIDX On RequestTimestamp;

Property RequestTimestamp As %String;

Property OriginalFilename As %String(MAXLEN = 255);

Property yJob As %Integer [ SqlColumnNumber = 2 ];

Property yRssAnon As %String [ SqlColumnNumber = 3 ];

Property yZStorage As %Integer [ SqlColumnNumber = 4 ];

Property yStorage As %Integer [ SqlColumnNumber = 5 ];

Property zMemo As %String(MAXLEN = 255);

ClassMethod NewRequest(pRequest As Ens.StreamContainer, pMemo As %String = "") As otw.iris.logger
{
	If (1 = (pRequest.%IsA("EnsLib.HTTP.GenericMessage"))) {
	}
	Set oLogger = ..%New()
	Set oLogger.RequestTimestamp = $ZDateTime($NOW(),3,1,3)
	If (1 = (pRequest.%IsA("%Net.HttpRequest"))) {
	}
	Set oLogger.OriginalFilename = pRequest.OriginalFilename
	Set oLogger.yJob = $JOB
	Set oLogger.yRssAnon = ##class(otw.iris.filereader).ReadRssAnon()
	Set oLogger.yZStorage = $ZStorage
	Set oLogger.yStorage = $Storage
    Set oLogger.zMemo = pMemo
	Quit oLogger
}

Storage Default
{
<Data name="loggerDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>RequestTimestamp</Value>
</Value>
<Value name="3">
<Value>OriginalFilename</Value>
</Value>
<Value name="4">
<Value>yJob</Value>
</Value>
<Value name="5">
<Value>yRssAnon</Value>
</Value>
<Value name="6">
<Value>yZStorage</Value>
</Value>
<Value name="7">
<Value>yStorage</Value>
</Value>
<Value name="8">
<Value>zMemo</Value>
</Value>
</Data>
<DataLocation>^otw.iris.loggerD</DataLocation>
<DefaultData>loggerDefaultData</DefaultData>
<IdLocation>^otw.iris.loggerD</IdLocation>
<IndexLocation>^otw.iris.loggerI</IndexLocation>
<StreamLocation>^otw.iris.loggerS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
