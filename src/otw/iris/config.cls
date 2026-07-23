Class otw.iris.config Extends %RegisteredObject
{

/// check if config has been setup
ClassMethod check() As %Integer
{
    Set tData = $Data(^config)
    Quit tData
}

/// setup workbook sheets to skip
ClassMethod setup() As %Status
{
    Set tSC = $$$OK
    Set ^config("skip","sheet","Bills") = 1
    Set ^config("skip","sheet","CarMax") = 2
    Set ^config("skip","sheet","PHP") = 3
    Set ^config("skip","sheet","Recurring") = 4
    Set ^config("skip","sheet","Mortgage") = 5
    Quit tSC
}

}
