<#import "parts/common.ftlh" as c>

<@c.page true false>
    <div>
        <table class="table table-striped">
            <thead>
            <tr>
                <#list fields as field>
                    <th scope="col">${field.label}</th>
                </#list>
            </tr>
            </thead>
            <tbody>
                <#list responses as response>
                    <tr>
                        <#list fields as field>
                            <td>
                                <#list response.fieldResponse as fieldId, value>
                                    <#if fieldId == field.id>${value}</#if>
                                </#list>
                            </td>
                        </#list>
                    </tr>
                </#list>
            </tbody>
        </table>
    </div>
</@c.page>