<#import "parts/common.ftlh" as c>

<@c.page false false>
    <form method="post" action="/registration">
        <div class="d-flex justify-content-center">
            <div class="card">
                <div class="card-body">
                    <div>
                        <label>LOGOTYPE</label>
                    </div>
                    <div>
                        <label>Sign Up</label>
                    </div>
                    ${message?if_exists}
                    <div class="input-group">
                        <input name="email" type="email" class="form-control ${(emailError??)?string('is-invalid', '')}" placeholder="Email" value="<#if usr??>${usr.email}</#if>">
                        <#if emailError??>
                            <div class="invalid-feedback">
                                ${emailError}
                            </div>
                        </#if>
                    </div>
                    <div class="input-group mt-1">
                        <input name="password" type="password" class="form-control ${(passwordError??)?string('is-invalid', '')}" placeholder="Password">
                        <#if passwordError??>
                            <div class="invalid-feedback">
                                ${passwordError}
                            </div>
                        </#if>
                    </div>
                    <div class="input-group mt-1">
                        <input name="password2" type="password" class="form-control ${(password2Error??)?string('is-invalid', '')}" placeholder="Confirm Password">
                        <#if password2Error??>
                            <div class="invalid-feedback">
                                ${password2Error}
                            </div>
                        </#if>
                    </div >
                    <div class="input-group mt-1">
                        <input name="firstName" type="text" class="form-control" placeholder="First Name" value="<#if usr??>${usr.firstName}</#if>">
                    </div>
                    <div class="input-group mt-1">
                        <input name="lastName" type="text" class="form-control" placeholder="Last Name" value="<#if usr??>${usr.lastName}</#if>">
                    </div>
                    <div class="input-group mt-1">
                        <input name="phoneNumber" type="text" class="form-control" placeholder="Phone Number" value="<#if usr??>${usr.phoneNumber}</#if>">
                    </div>
                    <div class="d-flex input-group mt-1">
                        <button type="submit" class="flex-fill btn btn-primary">SIGN UP</button>
                    </div>
                    <!-- For last string -->
                    <div class="container d-flex justify-content-center">
                        <label>Already have account?</label>
                        <a class="col-auto" href="/login">Log In</a>
                    </div>
                </div>
            </div>
        </div>
        <input type="hidden" value="${_csrf.token}" name="_csrf">
    </form>
</@c.page>