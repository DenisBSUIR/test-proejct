<#import "parts/common.ftlh" as c>

<@c.page true true>
<div>

    <!-- Info + Button -->
    <div class="container d-flex flex-row">
        <div>
            <h5>Fields</h5>
        </div>

        <!-- Add Field (button + modal) -->
        <div>
            <!--
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                ADD FIELD
            </button>

            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">

                <form action="addField" method="post">
                    <input type="hidden" value="${_csrf.token}" name="_csrf">

                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Add Field</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <div class="container d-flex flex-row">
                                <div>
                                    <div><label>Label</label></div>
                                    <div><input name="label" type="text"></div>
                                </div>
                            </div>
                            <div>
                                <div><label class="input-group-text" for="inputGroupSelection">Type</label></div>
                                <div>
                                    <select name="type" class="custom-select" id="inputGroupSelection">
                                        <option selected>Single line text</option>
                                        <option value="1">Multiline text</option>
                                        <option value="2">Radio button</option>
                                        <option value="3">Checkbox</option>
                                        <option value="4">Combobox</option>
                                        <option value="5">Date</option>
                                    </select>
                                </div>
                            </div>
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
            -->
            <button type="button" >
                ADD FIELD
            </button>
        </div>
    </div>

    <br>
    <br>
    <br>

    <form action="addField" method="post">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
    <div class="container">
        <div class="container d-flex flex-row">
            <div><label>Label</label></div>
            <div><input name="label" type="text"></div>
        </div>
        <div class="input-group">
            <div class="input-group-prepend">
                <label class="input-group-text" for="inputGroupSelection">Type</label>
            </div>
            <div>
                <select name="type" class="custom-select" id="inputGroupSelection">
                    <option selected value="SINGLE_LINE_TEXT">Single line text</option>
                    <option value="MULTILINE_TEXT">Multiline text</option>
                    <option value="RADIO_BUTTON">Radio button</option>
                    <option value="CHECKBOX">Checkbox</option>
                    <option value="COMBOBOX">Combobox</option>
                    <option value="DATE">Date</option>
                </select>
            </div>
        </div>
        <div class=" container d-flex flex-row">
            <div class="form-group form-check">
                <div><input name="required" class="form-check-input" type="checkbox" id="check1"></div>
                <div><label class="form-check-label" for="check">Required</label></div>
            </div>
            <div class="form-group form-check">
                <div><input name="active" class="form-check-input" type="checkbox" id="check2"></div>
                <div><label class="form-check-label" for="check">Is Active</label></div>
            </div>
        </div>
        <div>
            <button type="submit" class="btn btn-primary">SAVE</button>
        </div>
    </div>
    </form>
    <br>
    <br>
    <br>


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
                    <td></td>
                </tr>
                </#list>
            </tbody>
        </table>
    </div>


</div>
</@c.page>