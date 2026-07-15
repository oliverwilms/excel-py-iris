Class otw.iris.util
{

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
