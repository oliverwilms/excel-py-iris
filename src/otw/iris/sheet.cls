Class otw.iris.sheet Extends %Persistent
{

ClassMethod GetNewNumber() As %Integer
{
	Quit $Increment(^otw.iris.sheetNumber)
}

Property Name As %String;

Property Number As %Integer;

Index NameIndex On Name [ IdKey, PrimaryKey, Unique ];

Storage Default
{
<Data name="sheetDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Number</Value>
</Value>
</Data>
<DataLocation>^otw.iris.sheetD</DataLocation>
<DefaultData>sheetDefaultData</DefaultData>
<ExtentSize>1</ExtentSize>
<IdLocation>^otw.iris.sheetD</IdLocation>
<IndexLocation>^otw.iris.sheetI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>8</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Name">
<AverageFieldSize>8</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Number">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<SQLMap name="NameIndex">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^otw.iris.sheetS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
