<#import "parts/common.ftlh" as c>

<@c.page false false>
    <form action="/login" method="post">
        <div class="d-flex justify-content-center align-items-center">
            <div class="card" style="width: 22rem;">
                <div class="card-body">
                    <div>
                        <label>LOGOTYPE</label>
                    </div>
                    <div>
                        <label>Log in</label>
                    </div>
                    <!--
                    <#if Session?? && Session.SPRING_SECURITY_LAST_EXCEPTION??>
                        <div class="alert alert-warning" role="alert">
                            Bad credentials
                        </div>
                    </#if>
                    -->
                    <div>
                        <input class="form-control mt-1" name="email" type="text" placeholder="Email">
                    </div>
                    <div>
                        <input class="form-control mt-1" name="password" type="password" placeholder="Password">
                    </div>

                    <div class="row">
                        <div class="col">
                            <!-- Remember me -->
                        </div>
                        <div class="col">
                            <!-- Forgot your password -->
                        </div>
                    </div>

                    <div class="d-flex mt-1">
                        <button class="flex-fill btn btn-primary" type="submit">Log in</button>
                    </div>

                    <div class="d-flex justify-content-center">Don't have account?
                        <a href="/registration">Sign In</a>
                    </div>
                </div>
                <input type="hidden" value="${_csrf.token}" name="_csrf">
            </div>
    </form>
</@c.page>