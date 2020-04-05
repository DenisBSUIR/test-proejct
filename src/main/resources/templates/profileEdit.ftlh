<#import "parts/common.ftlh" as c>

<@c.page true true>
    <div class="d-flex justify-content-center">
        <div class="card">
            <div class="card-header bg-white">
                <div>
                    <label>Edit Profile</label>
                </div>
                <div class="card-body">
                    <form method="post" action="/changeProfile">
                        <div class="form-group mt-1">
                            <label for="firstName">First Name</label>
                            <input name="firstName" id="firstName" type="text" class="form-control" value="<#if usr??>${usr.firstName}</#if>">
                        </div>
                        <div class="form-group mt-1">
                            <label for="lastName">Last Name</label>
                            <input name="lastName" id="lastName" type="text" class="form-control" value="<#if usr??>${usr.lastName}</#if>">
                        </div>
                        <div class="form-group mt-1">
                            <label for="email">Email</label>
                            <input name="email" id="email" type="email" class="form-control" value="<#if usr??>${usr.email}</#if>">
                        </div>
                        <div class="form-group mt-1">
                            <label for="phone">Phone Number</label>
                            <input name="phoneNumber" id="phone" type="text" class="form-control" value="<#if usr??>${usr.phoneNumber}</#if>">
                        </div>
                        <div class="d-flex input-group mt-1">
                            <button type="submit" class="flex-fill btn btn-primary">SAVE</button>
                        </div>
                        <input type="hidden" value="${usr.id}" name="userId">
                        <input type="hidden" value="${_csrf.token}" name="_csrf">
                    </form>
                </div>
            </div>
        </div>
    </div>
</@c.page>