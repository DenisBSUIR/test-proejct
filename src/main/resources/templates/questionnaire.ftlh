<#import "parts/common.ftlh" as c>


<@c.page true false>
    <div>

            <form action="/response" method="post">
            <div>
                <#list fields as field>
                    <div>
                        <#if field.type.name() == "SINGLE_LINE_TEXT">
                            <div>
                                <label>${field.label}</label>
                                <input name="${field.label}" type="text">
                            </div>
                        <#elseif field.type.name() == "MULTILINE_TEXT">
                            <div>
                                <label>${field.label}</label>
                                <textarea name="${field.label}" rows="5" cols="30"></textarea>
                            </div>
                        <#elseif field.type.name() == "RADIO_BUTTON">
                            <div>

                            </div>
                        <#elseif field.type.name() == "CHECKBOX">
                            <div>
                                <div><label class="form-check-label" for="check">${field.label}</label></div>
                                <div><input name="${field.label}" class="form-check-input" type="checkbox" id="check"></div>
                            </div>
                        <#elseif field.type.name() == "COMBOBOX">
                            <div>

                            </div>
                        <#elseif field.type.name() == "DATE">
                            <div>
                                <label>${field.label}</label>
                                <input name="${field.label}" type="date">
                            </div>
                        </#if>
                        </div>
                </#list>
            </div>
                <button type="submit">SAVE</button>
                <input type="hidden" value="${_csrf.token}" name="_csrf">
            </form>

    </div>
</@c.page>