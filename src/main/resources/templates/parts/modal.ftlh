<#macro modal field>

    <div class="modal" id="modalEdit" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">

        <form action="changeField" method="post">
            <input type="hidden" value="${_csrf.token}" name="_csrf">
            <input type="hidden" value="${field.id}" name="id">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="modalLabel">Edit Field</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group row">
                            <div>
                                <label class="col-form-label" for="label">Label</label>
                            </div>
                            <div>
                                <input name="label" class="form-control" id="label" type="text" value="${field.label}">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-form-label">
                                <label for="typeSelector">Type</label>
                            </div>
                            <div>
                                <select name="type" class="custom-select" id="typeSelector">
                                    <option <#if field.type.name() == "SINGLE_LINE_TEXT">selected</#if> value="SINGLE_LINE_TEXT">Single line text</option>
                                    <option <#if field.type.name() == "MULTILINE_TEXT">selected</#if> value="MULTILINE_TEXT">Multiline text</option>
                                    <option <#if field.type.name() == "RADIO_BUTTON">selected</#if> value="RADIO_BUTTON">Radio button</option>
                                    <option <#if field.type.name() == "CHECKBOX">selected</#if> value="CHECKBOX">Checkbox</option>
                                    <option <#if field.type.name() == "COMBOBOX">selected</#if> value="COMBOBOX">Combobox</option>
                                    <option <#if field.type.name() == "DATE">selected</#if> value="DATE">Date</option>
                                </select>
                            </div>
                        </div>

                        <div id="options" style="display: none">
                            <div class="form-group row">
                                <label class="col-form-label" for="optionsField">Options</label>
                                <textarea class="form-control" id="optionsField" name="options" rows="3" cols="5" placeholder="<#list field.options as option>${option}<#sep><br></#list>"></textarea>
                            </div>
                        </div>

                        <script>
                            var choose = document.querySelector('#typeSelector');

                            var options = document.querySelector('#options');
                            choose.addEventListener('change', function () {
                                if(this.value == 'RADIO_BUTTON' || this.value == 'COMBOBOX'){
                                    options.style.display = 'block';
                                } else {
                                    options.style.display = 'none';
                                }
                            })
                        </script>

                        <div class="d-flex flex-row">
                            <div class="form-group form-check">
                                <div><input name="required" class="form-check-input" type="checkbox" id="check1" <#if field.required>checked</#if>></div>
                                <div><label class="form-check-label" for="check">Required</label></div>
                            </div>
                            <div class="form-group form-check">
                                <div><input name="active" class="form-check-input" type="checkbox" id="check2" <#if field.active>checked</#if>></div>
                                <div><label class="form-check-label" for="check">Is Active</label></div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">CANCEL</button>
                        <button type="submit" class="btn btn-primary">CHANGE</button>
                    </div>
                </div>
            </div>
        </form>

    </div>
</#macro>