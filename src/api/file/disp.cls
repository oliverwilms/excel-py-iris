/// Upload file.
/// Dispatch class defined by RESTSpec in api.file.spec
Class api.file.disp Extends %CSP.REST [ GeneratedBy = api.file.spec.cls, ProcedureBlock ]
{

/// The class containing the RESTSpec which generated this class
Parameter SpecificationClass = "api.file.spec";

/// Ignore any writes done directly by the REST method.
Parameter IgnoreWrites = 1;

/// Default the Content-Type for this application.
Parameter CONTENTTYPE = "application/json";

/// By default convert the input stream to Unicode
Parameter CONVERTINPUTSTREAM = 1;

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
  <!-- Upload a file -->
  <Route Url="/upload-file" Method="post" Call="uploadFile" />
</Routes>
}

/// Upload a file
ClassMethod uploadFile() As %Status
{
    Try {
        If $case(%request.ContentType,"multipart/form-data":0,:1) {
            Try {
                Do ##class(api.file.impl).%ReportRESTError(..#HTTP415UNSUPPORTEDMEDIATYPE,$$$ERROR($$$RESTContentType,%request.ContentType))
            } Catch {
                Do ##class(%REST.Impl).%ReportRESTError(..#HTTP415UNSUPPORTEDMEDIATYPE,$$$ERROR($$$RESTContentType,%request.ContentType))
            }
            Quit
        }
        Do ##class(%REST.Impl).%SetContentType("application/json")
        If '##class(%REST.Impl).%CheckAccepts("application/json") {
            Try {
                Do ##class(api.file.impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts))
            } Catch {
                Do ##class(%REST.Impl).%ReportRESTError(..#HTTP406NOTACCEPTABLE,$$$ERROR($$$RESTBadAccepts))
            }
            Quit
        }
        If '$data(%request.MimeData("file",1)) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTRequired,"file")) Quit
        If $data(%request.MimeData("file",2)) {
            Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTDuplicate,"file")) Quit
        }
        Set pfile=%request.MimeData("file",1)
        Set stream=##class(%GlobalCharacterStream).%New()
        If $isobject(pfile) {
            Do pfile.Rewind()
            Set sc=stream.CopyFrom(pfile)
        } Else {
            Set sc=stream.Write(pfile)
        }
        If $$$ISERR(sc) Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTInvalid,"file",pfile)) Quit
        Set pfile=stream
        If $data(%request.Data("metadata",2)) {
            Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTDuplicate,"metadata")) Quit
        }
        If $data(%request.Data("metadata",1)) {
            Set pmetadata=%request.Data("metadata",1)
        }
        If $data(%request.Data("description",2)) {
            Do ##class(%REST.Impl).%ReportRESTError(..#HTTP400BADREQUEST,$$$ERROR($$$RESTDuplicate,"description")) Quit
        }
        If $data(%request.Data("description",1)) {
            Set pdescription=%request.Data("description",1)
        }
        Set response=##class(api.file.impl).uploadFile(pfile,.pmetadata,.pdescription)
        Do ##class(api.file.impl).%WriteResponse(response)
    } Catch (ex) {
        Try {
            Do ##class(api.file.impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("api.file.impl","ExposeServerExceptions"))
        } Catch {
            Do ##class(%REST.Impl).%ReportRESTError(..#HTTP500INTERNALSERVERERROR,ex.AsStatus(),$parameter("api.file.impl","ExposeServerExceptions"))
        }
    }
    Quit $$$OK
}

}
