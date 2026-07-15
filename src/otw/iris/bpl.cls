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
<property name='ExcelName' type='%String' instantiate='0' deletewithcontext='0' >
<parameters>
<parameter name='MAXLEN'  value='32755' />
</parameters>
</property>
</context>
<sequence xend='200' yend='650' >
<trace name='OriginalFilename' value='request.OriginalFilename' xpos='200' ypos='250' />
<code name='oLogger' xpos='200' ypos='350' >
<annotation><![CDATA[Before Python]]></annotation>
<![CDATA[ Set tMemo = "Before Python"
 Set oLogger = ##class(otw.iris.logger).NewRequest(request,tMemo)
 Set x = oLogger.yRssAnon
 Set tSC = oLogger.%Save()]]>
</code>
<code name='Python' xpos='200' ypos='450' >
<![CDATA[ Set context.ExcelName = ##class(otw.iris.util).GetExcelName(request.OriginalFilename)
 Set py2 = ##class(%SYS.Python).Import("iter_excel")
 Do py2."iterate_excel_all_sheets"(context.ExcelName)]]>
</code>
<code name='oLogger2' xpos='200' ypos='550' >
<annotation><![CDATA[After Python]]></annotation>
<![CDATA[ Set tMemo = "After Python"
 Set oLogger = ##class(otw.iris.logger).NewRequest(request,tMemo)
 Set x = oLogger.yRssAnon
 Set tSC = oLogger.%Save()]]>
</code>
</sequence>
</process>
}

}
