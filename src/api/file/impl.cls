/// Upload file.<br/>
/// Business logic class defined by OpenAPI in api.file.spec<br/>
/// Created Jul 20, 2026 20:03:45
Class api.file.impl Extends %REST.Impl [ ProcedureBlock ]
{

/// If ExposeServerExceptions is true, then details of internal errors will be exposed.
Parameter ExposeServerExceptions = 0;

/// Accepts file via multipart/form-data. Returns a structured JSON response with an ingestion ID on success.<br/>
/// The method arguments hold values for:<br/>
///     file, my data file<br/>
///     metadata, JSON metadata payload containing patient, provider, visit, document, and source information<br/>
///     description, Legacy description field. Use metadata field for structured JSON going forward.<br/>
ClassMethod uploadFile(file As %Stream.Object, metadata As %String, description As %String) As %DynamicObject
{
    Set otw = $I(^TESTunit("uploadFile"))
    Set ^TESTunit("files",otw,"file")=$GET(file)
    Set ^TESTunit("files",otw,"desc")=$GET(description)
    Set ^TESTunit("files",otw,"meta")=$GET(metadata)
    Try {
	    Set object = ##class(%Stream.FileBinary).%New()
        Set tDirName = "/opt/irisapp/excel"
        Set tFilename = "test.xlsx"
        Set tFilePath = ##class(%File).NormalizeFilename(tFilename,tDirName)
        Set ^TESTunit("files",otw,"tFilePath")=$GET(tFilePath)
	    //Set tSC = object.LinkToFile("C:\temp\test.xlsx") ; if Windows
        Set tSC = object.LinkToFile(tFilePath)
	    Set ^TESTunit("files",otw,"LinkToFile")=$GET(tSC)
	    //Do object.Image.LinkToFile("/tmp/image.jpg")    ; if Unix
	    Set tSC = object.CopyFrom(file)
	    Set ^TESTunit("files",otw,"CopyFrom")=$GET(tSC)
	    Set tSC = object.%Save()
	    Set ^TESTunit("files",otw,"%Save")=$GET(tSC)
    } Catch ex {
    }
    //(Place business logic here)
    Do ..%SetStatusCode(200)
    //(Place business logic here)
    //Do ##class(Oliver.RequestLogger).NewRequest(%request)
    //Set oRequestLogger = ##class(Oliver.RequestLogger).NewRequest(%request)
    Set tStatusCode = 200  // oRequestLogger.StatusCode
    Do ..%SetStatusCode(tStatusCode)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
    Quit "returnString"
    //Set tReturnString = $System.Status.GetErrorText(oRequestLogger.Status)
    //Quit tReturnString
}

}
