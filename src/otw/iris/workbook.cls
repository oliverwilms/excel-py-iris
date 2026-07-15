Class otw.iris.workbook
{

ClassMethod importWorkbook(pSkipSheets = 4, pDebug = 0, pKill = 1) As %Status
{
	Set tSC = $$$OK
	If (1 = pKill) { Kill ^excel }
	Set tSheet = $Get(pSkipSheets)
	For {
		Set tSheet = $Order(^wbook(tSheet),1)
		If (tSheet = "") { Quit }
		Set tSC = ..ImportWorkbookSheet(tSheet)
		If $$$ISERR(tSC) { Quit }
	}
	Quit tSC
}

ClassMethod ImportWorkbookCell(pSheet As %String = "", pCell As %String = "", pDebug = 1) As %Status
{
	If pDebug Write pSheet," ",pCell,": "
	If ("" = pSheet) { Quit $$$ERROR($$$GeneralError,"Sheet is required.") }
	Set tSC = $$$OK
	Set objSheet = ##class(sheet).%OpenId(pSheet)
	If (0 = $IsObject(objSheet)) {
		Set objSheet = ##class(sheet).%New(pSheet)
		Set objSheet.Name = pSheet
		Set objSheet.Number = ##class(sheet).GetNewNumber()
		Set tSC = objSheet.%Save()
	}
	Try {
		Set tColumn = $Extract(pCell,1,1)
		Set tRow = -1 + $Extract(pCell,2,*)  // Header row should be zero instead of one
		Set tSheetNumber = objSheet.Number
		Set tValue = $Get(^wbook(pSheet,pCell))
		If pDebug Write tValue,!
		Set ^excel(tSheetNumber,tRow,tColumn) = tValue
	} Catch ex {
		Write ex,!
	}
	Quit tSC
}

ClassMethod ImportWorkbookSheet(pSheet As %String = "", pDebug = 0) As %Status
{
	If pDebug Write pSheet,!
	Set tSC = $$$OK
	If (pSheet = "") { Quit tSC }
	Set tCell = ""
	For {
		Set tCell = $Order(^wbook(pSheet,tCell),1,tValue)
		If (tCell = "") { Quit }
		If pDebug Write tCell,": ",tValue,!
		Set tSC = ..ImportWorkbookCell(pSheet,tCell)
	}
	Quit tSC
}

}
