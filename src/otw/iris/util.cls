Class otw.iris.util
{

/// Get a list of files in the directory configured by FilePath.
/// The filenames are returned in a %ListOfDataTypes object. Each entry in the list is
/// a semicolon-separated string containing: Filename;Type;Size;DateCreated;DateModified;FullPathName
ClassMethod FileSet(Output pFileList As %ListOfDataTypes, pFilePath As %String = "", pWildcards As %String = "*", pIncludeDirs As %Boolean = 0) As %Status
{
	#; ={$Select($$$isVMS:"*.*",1:"*")}
	Set $ZT="Trap",tSC=$$$OK
	do {
		Kill pFileList Set pFileList=##class(%ListOfDataTypes).%New()
		//$$$catTRACE("file","Getting list of filenames for "_..fixPath(..FilePath))
		Set tResultSet=##class(%ResultSet).%New("%File:FileSet")
		Set tSC=tResultSet.Execute(pFilePath,pWildcards,"Type",pIncludeDirs)  Quit:$$$ISERR(tSC)
		While 0'=tResultSet.Next() {
			#; PathName;Type;Size;DateCreated;DateModified;Name
			Set tSC = pFileList.Insert(tResultSet.GetData(6)_";="_tResultSet.GetData(2)_";"_tResultSet.GetData(3)_";created="_tResultSet.GetData(4)_";modified="_tResultSet.GetData(5)_";"_tResultSet.GetData(1))  Quit:$$$ISERR(tSC)
		}
	} while (0)
	//If $$$ISERR(tSC) $$$LOGSTATUS(tSC)
Exit
	Quit tSC
Trap
	Set $ZT="",tSC=$$$ERROR($$$GeneralError,"FileSet Error")
	Goto Exit
}

/// "/opt/irisapp/archive/excel_python_iris.xlsx_2026-07-15_00.23.28.242"
ClassMethod GetExcelName(pOriginalFilename As %String = "") As %String
{
	If ("" = pOriginalFilename) { Quit "" }
	Set tExtension = ".xlsx"
    Set tDirectory = ##class(%File).GetDirectory(pOriginalFilename)
    Set tFilename = ##class(%File).GetFilename(pOriginalFilename)
    Set tPrefix = $Piece(tFilename,tExtension,1)
    Set tPostfix = $Piece(tFilename,tExtension,2,*)
    Set tFilename = tPrefix_tPostfix_tExtension
    Set tReturn = ##class(%File).NormalizeFilename(tFilename,tDirectory)
    Quit tReturn
}

}
