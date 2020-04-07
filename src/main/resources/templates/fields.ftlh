<#import "parts/common.ftlh" as c>
<#import "parts/modal.ftlh" as m>

<@c.page true true>

    <div>
        <!-- Add Field (button + modal) -->
        <div>

            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#modal">
                ADD FIELD
            </button>

            <div class="modal" id="modal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">

                <form action="addField" method="post">
                    <input type="hidden" value="${_csrf.token}" name="_csrf">

                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="modalLabel">Add Field</h5>
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
                                        <input name="label" class="form-control" id="label" type="text">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-form-label">
                                        <label for="typeSelector">Type</label>
                                    </div>
                                    <div>
                                        <select name="type" class="custom-select" id="typeSelector">
                                            <option selected value="SINGLE_LINE_TEXT">Single line text</option>
                                            <option value="MULTILINE_TEXT">Multiline text</option>
                                            <option value="RADIO_BUTTON">Radio button</option>
                                            <option value="CHECKBOX">Checkbox</option>
                                            <option value="COMBOBOX">Combobox</option>
                                            <option value="DATE">Date</option>
                                        </select>
                                    </div>
                                </div>

                                <div id="options" style="display: none">
                                    <div class="form-group row">
                                        <label class="col-form-label" for="optionsField">Options</label>
                                        <textarea class="form-control" id="optionsField" name="options" rows="3" cols="5"></textarea>
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
                                        <div><input name="required" class="form-check-input" type="checkbox" id="check1"></div>
                                        <div><label class="form-check-label" for="check">Required</label></div>
                                    </div>
                                    <div class="form-group form-check">
                                        <div><input name="active" class="form-check-input" type="checkbox" id="check2"></div>
                                        <div><label class="form-check-label" for="check">Is Active</label></div>
                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">CANCEL</button>
                                <button type="submit" class="btn btn-primary">SAVE</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>


        <br>
        <br>
        <br>

        <div class="card">
            <div class="card-header bg-white">
                <div>
                    <label>Fields</label>
                </div>
            </div>
            <div class="card-body">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">Label</th>
                        <th scope="col">Type</th>
                        <th scope="col">Required</th>
                        <th scope="col">Is Active</th>
                        <th scope="col"></th>
                    </tr>
                    </thead>
                    <tbody>
                    <#list fields as field>
                    <tr>
                        <td>${field.label}</td>
                        <td>${field.type}</td>
                        <td><#if field.required>True<#else>False</#if></td>
                        <td><#if field.active>True<#else>False</#if></td>
                        <td>
                            <div class="d-flex row">
                                <div class="col">
                                        <button class="glyphicon glyphicon-edit btn btn-link" type="submit" data-toggle="modal" data-target="#modalEdit"></button>
                                    </form>
                                </div>
                                <div class="col">
                                    <button class="glyphicon glyphicon-trash btn btn-link" type="button"></button>
                                </div>
                            </div>
                            <@m.modal field></@m.modal>
                        </td>
                    </tr>
            </div>
            <#else>
                No fields
            </#list>
            </tbody>
            </table>
        </div>
    </div>
    </div>
</@c.page>