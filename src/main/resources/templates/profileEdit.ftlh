<#import "parts/common.ftlh" as c>

<@c.page true true>
    <form method="post" action="/changeProfile">
        <div>
            <div>Edit Profile</div>
            <div>
                <label>First Name</label>
                <input name="firstName" type="text" value="${user.firstName}">
            </div>
            <div>
                <label>Last Name</label>
                <input name="lastName" type="text" value="${user.lastName}">

            </div>
            <div>
                <label>Email</label>
                <input name="email" type="text" value="${user.email}">
            </div>
            <div>
                <label>Phone Number</label>
                <input name="phoneNumber" type="text" value="${user.phoneNumber}">
            </div>
            <div>
                <button type="submit">SAVE</button>
            </div>
        </div>
        <input type="hidden" value="${_csrf.token}" name="_csrf">
    </form>
</@c.page>