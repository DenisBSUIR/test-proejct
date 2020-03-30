<#import "parts/common.ftlh" as c>

<@c.page false false>
    <form action="/login" method="post">
        <div>
            <div>LOGOTYPE</div>
            <div>Log in</div>
            <div><input name="email" type="text" placeholder="Email"></div>
            <div><input name="password" type="password" placeholder="Password"></div>
            <div><button type="submit">Log in</button></div>

        </div>
        <div>
            <div>Don't have account?</div>
            <a href="/registration">Sign In</a>
        </div>
        <input type="hidden" value="${_csrf.token}" name="_csrf">
    </form>
</@c.page>