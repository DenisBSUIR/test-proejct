<#import "parts/common.ftlh" as c>


<@c.page true false>
    <div class="container d-flex justify-content-center mt-5">
        <div class="card border-secondary" style="width: 22rem;">
            <form action="/response" method="post">
                <div class="card-body">
                    <#list fields as field>
                        <div>
                            <#if field.type.name() == "SINGLE_LINE_TEXT">
                                <div class="form-group">
                                    <label for="textField">${field.label}</label>
                                    <input class="form-control" name="${field.label}" type="text" id="textField">
                                </div>
                            <#elseif field.type.name() == "MULTILINE_TEXT">
                                <div>
                                    <label for="textareaField">${field.label}</label>
                                    <textarea class="form-control" name="${field.label}" rows="3" cols="30" id="textareaField"></textarea>
                                </div>
                            <#elseif field.type.name() == "RADIO_BUTTON">
                                <div>

                                </div>
                            <#elseif field.type.name() == "CHECKBOX">
                                <div class="form-group form-check">
                                    <input name="${field.label}" class="form-check-input" type="checkbox" id="check">
                                    <label class="form-check-label" for="check">${field.label}</label>
                                </div>
                            <#elseif field.type.name() == "COMBOBOX">
                                <div>

                                </div>
                            <#elseif field.type.name() == "DATE">
                                <div class="form-group">
                                    <label for="dateField">${field.label}</label>
                                    <input class="form-control" name="${field.label}" type="date" id="dateField">
                                </div>
                            </#if>
                        </div>
                    </#list>
                </div >
                <div class="container">
                    <button class="btn btn-primary" type="submit">SAVE</button>
                </div>
                <input type="hidden" value="${_csrf.token}" name="_csrf">
            </form>
        </div>
    </div>
</@c.page>