<#include "security.ftlh">

<#macro navbar fullNavbar>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container d-flex flex-row ">
                <div class="navbar-brand">
                    <div>LOGOTYPE</div>
                </div>

                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon "></span>
                </button>

                <div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
                    <#if fullNavbar>
                        <ul class="navbar-nav">
                            <li class="nav-item active ml-5">
                                <a class="nav-link " href="/fields">Fields <span class="sr-only ">(current)</span></a>
                            </li>
                            <li class="nav-item ml-5">
                                <a class="nav-link" href="/responses">Responses</a>
                            </li>
                            <li class="nav-item ml-5">
                                <div class="dropdown">
                                    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        ${firstName} ${lastName}
                                    </button>
                                    <div class="dropdown-menu bg-light" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item" href="/profileEdit">Edit Profile</a>
                                        <a class="dropdown-item" href="/passwordChange">Change Password</a>
                                        <form action="/logout" method="post">
                                            <button type="submit" class="dropdown-item">Log Out</button>
                                            <input type="hidden" value="${_csrf.token}" name="_csrf">
                                        </form>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    <#else>
                        <a class="nav-item text-secondary" href="/login">Log In</a>
                    </#if>
                </div>
            </div>
        </div>
    </nav>
</#macro>