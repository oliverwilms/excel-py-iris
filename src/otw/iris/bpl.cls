/// 
Class otw.iris.bpl Extends Ens.BusinessProcessBPL
{

Storage Default
{
<Type>%Storage.Persistent</Type>
}

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='Ens.StreamContainer' response='Ens.Response' height='2000' width='2000' >
<context>
<property name='ValidResult' type='%String' instantiate='0' deletewithcontext='0' >
<parameters>
<parameter name='MAXLEN'  value='32755' />
</parameters>
</property>
</context>
<sequence xend='200' yend='950' >
<trace name='OriginalFilename' value='request.OriginalFilename' xpos='200' ypos='250' />
<code name='oLogger' xpos='200' ypos='350' >
<![CDATA[ Set oLogger = ##class(otw.iris.logger).NewRequest(request)
 Set x = oLogger.yRssAnon
 Set tSC = oLogger.%Save()]]>
</code>
<code name='OpenAPI schema validation' xpos='200' ypos='450' >
<![CDATA[ Set pType = "POST"
 Set pURL = "/api/test/orders/12345"
 Set pJSONMessage = { "status":"pending","start_date":"02/28/2026","request_service_name":"Contact lenses" }.%ToJSON()
 Set pHeaders = ##class(%SYS.Python).Builtins().dict()
 Do pHeaders.setdefault("Authorization", "SAML myfakesamltoken")
 Do pHeaders.setdefault("Content-Type", "application/json")
 Set py = ##class(%SYS.Python).Import("validate_openapi_request")
 Try { Set openapidoc = process.pOpenAPIdoc } 
 Catch exp {
  Set openapidoc = "/opt/irisapp/yaml/orders_openapi.yaml"
 }
 Set context.ValidResult = py.validateOpenapiRequest(openapidoc, pType, pURL, pJSONMessage, .pHeaders)]]>
</code>
<trace name='context.ValidResult' value='context.ValidResult' xpos='200' ypos='550' />
<code name='oLogger2' xpos='200' ypos='650' >
<![CDATA[ Set oLogger = ##class(otw.iris.logger).NewRequest(request)
 Set x = oLogger.yRssAnon
 Set tSC = oLogger.%Save()]]>
</code>
<code name='excel' xpos='200' ypos='750' >
<![CDATA[ Set pFilePath = request.OriginalFilename
 Set py2 = ##class(%SYS.Python).Import("iter_excel")
 Do py2."iterate_excel_all_sheets"(pFilePath)]]>
</code>
<code name='oLogger3' xpos='200' ypos='850' >
<![CDATA[ Set oLogger = ##class(otw.iris.logger).NewRequest(request)
 Set x = oLogger.yRssAnon
 Set tSC = oLogger.%Save()]]>
</code>
</sequence>
</process>
}

}
