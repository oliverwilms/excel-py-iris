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
    //(Place business logic here)
    //Do ..%SetStatusCode(<HTTP_status_code>)
    //Do ..%SetHeader(<name>,<value>)
    //Quit (Place response here) ; response may be a string, stream or dynamic object
}

}
