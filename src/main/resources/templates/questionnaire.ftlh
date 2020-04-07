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
                                    <label for="radioButtonField">${field.label}</label>
                                    <div id="radiobuttonField">
                                        <#list field.options as option>
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="${field.label}" id="radioButton${option?index}" value="${option}" <#if option?index == 0>checked</#if>>
                                                <label class="form-check-label" for="radioButton${option?index}">${option}</label>
                                            </div>
                                        </#list>
                                    </div>
                                </div>
                            <#elseif field.type.name() == "CHECKBOX">
                                <div class="form-group form-check">
                                    <input name="${field.label}" class="form-check-input" type="checkbox" id="check">
                                    <label class="form-check-label" for="check">${field.label}</label>
                                </div>
                            <#elseif field.type.name() == "COMBOBOX">
                                <div class="form-group">
                                    <label for="selector"></label>
                                    <select name="${field.label}" class="custom-select" id="selector">
                                        <#list field.options as option>
                                            <option <#if option?index == 0>selected</#if> value="${option}">${option}</option>
                                        </#list>
                                    </select>
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