Class api.file.config
{

ClassMethod CreateWebApp() As %Status
{
    Set tNamespace = $NAMESPACE
    ZN "%SYS"
    Do ##class(Security.System).GetInstallationSecuritySetting(.security)
    If (security="None") {
        Set cspProperties("AutheEnabled") = $$$AutheUnauthenticated
    } Else {
        Set cspProperties("AutheEnabled") = $$$AutheCache // Password
    }
    Set cspName = "/csp/files"
    Set cspProperties("NameSpace") = $Get(tNamespace,"USER")
    Set cspProperties("Enabled") = 1
    Set cspProperties("DeepSeeEnabled") = 1
    Set cspProperties("iKnowEnabled") = 0
    Set cspProperties("DispatchClass") = "api.file.disp"
    Set cspProperties("Resource") = ""
    Set cspProperties("ServeFiles") = 1
    Set tSC = ##class(Security.Applications).Create(cspName,.cspProperties)
    If $$$ISERR(tSC) Throw ##class(%Installer.Exception).CreateFromStatus(tSC)
    ZN tNamespace
    Quit $$$OK
}

}
