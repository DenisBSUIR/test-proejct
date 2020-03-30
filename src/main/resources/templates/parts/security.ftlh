<#assign know = Session.SPRING_SECURITY_CONTEXT??>

<#if know>
    <#assign
    user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    firstName = user.getFirstName()
    lastName = user.getLastName()>
<#else>
    <#assign
    name = "unknown">
</#if>