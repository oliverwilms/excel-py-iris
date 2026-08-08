Class otw.iris.python
{

ClassMethod IterAllSheets(pExcelFile As %String = "") As %Status
{
  Set sc = $$$OK
  Set py = ##class(%SYS.Python).Import("iter_excel")
  write py."iterate_excel_all_sheets"(pExcelFile)
  Return sc
}

}
