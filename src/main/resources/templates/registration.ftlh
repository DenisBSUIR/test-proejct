<#import "parts/common.ftlh" as c>

<@c.page false false>
    <form method="post" action="/registration">
        <div>
            <div>LOGOTYPE</div>
            <div>Sign Up</div>
            <div><input name="email" type="text" placeholder="Email"></div>
            <div><input name="password" type="text" placeholder="Password"></div>
            <div><input name="confirmPassword" type="text" placeholder="Confirm Password"></div>
            <div><input name="firstName" type="text" placeholder="First Name"></div>
            <div><input name="lastName" type="text" placeholder="Last Name"></div>
            <div><input name="phoneNumber" type="text" placeholder="Phone Number"></div>
            <div><button type="submit">SIGN UP</button> </div>
            <!-- For last string -->
            <div>
                <div>Already have account?</div>
                <a href="/login">Log In</a>
            </div>
        </div>
        <input type="hidden" value="${_csrf.token}" name="_csrf">
    </form>
</@c.page>