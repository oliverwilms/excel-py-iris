Class otw.iris.filereader
{

ClassMethod ReadRssAnon(pFile As %String = "", pDebug = 0, pCRLF = "") As %String
{
	Write:pDebug "ReadTextFile",!
    Set procStatus = "/proc/#/status"
    Set pFile = $Replace(procStatus,"#",$JOB)
	If ($Get(pFile) = "") Quit ""
	Write:pDebug pFile,!
    Set pFind = "RssAnon:"
	Set tReturn = ""
	Set timeout = 2
	Try {
		Open pFile:("R"):timeout  // read
		If $test {
			Write:pDebug "Open",!
			Use pFile
			Set pos = $ZPOS
			Set pos = $ZSEEK(0,0)
			Set tEOF = 0
			For {
				Set pos = $ZPOS
				Try {
					Read tText
                    If (tText [ pFind) {
                        Set tReturn = $Piece(tText,pFind,2)
                        Set tReturn = $ZStrip(tReturn,"<>W")
                        Quit
                    }
				} Catch {
					Set tEOF = 1
				}
				Set:pDebug ^DEBUG($I(DEBUG))=$GET(tText)
				If tEOF { Quit }
			}
			Close pFile
		}
	}
	Catch exception {
		If exception.%IsA("%Exception.SystemException") {
			Do BACK^%ETN // Log error in error log
		} Else {
			Throw exception // We will just throw these to outer error handler
		}
		Close pFile
	}
	Quit tReturn
}

}
