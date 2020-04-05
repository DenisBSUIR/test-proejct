<#import "parts/common.ftlh" as c>

<@c.page true true>
    <form method="post" action="/saveNewPassword">
        <div class="d-flex justify-content-center">
            <div class="card" style="width: 22rem;">
                <div class="card-header bg-white">
                    <label>Change Password</label>
                </div>
                <div class="card-body">
                    <div class="form-group">
                        <label for="current">Current Password</label>
                        <input class="form-control" name="currentPassword" type="password" id="current">
                    </div>
                    <div class="form-group">
                        <label for="new">New Password</label>
                        <input class="form-control" name="newPassword" type="password" id="new">

                    </div>
                    <div class="form-group">
                        <label for="conf">Confirm New Password</label>
                        <input class="form-group" name="confirm" type="password" id="conf">
                    </div>
                    <div class="container">
                        <button class="btn btn-primary" type="submit">CHANGE</button>
                    </div>
                </div>
            </div>
            <input type="hidden" value="${_csrf.token}" name="_csrf">
        </div>
    </form>
</@c.page>