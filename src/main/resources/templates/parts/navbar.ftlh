<#include "security.ftlh">

<#macro navbar fullNavbar>

    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div>LOGOTYPE</div>
                </div>
                <div class="col">


                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <#if fullNavbar>
                            <ul class="navbar-nav mr-auto">
                                <li class="nav-item">
                                    <a class="nav-link" href="/fields">Fields</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="/responses">Responses</a>
                                </li>
                                <li class="nav-item">
                                    <div class="dropdown">
                                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            ${firstName} ${lastName}
                                        </button>
                                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                            <a class="dropdown-item" href="/profileEdit">Edit Profile</a>
                                            <a class="dropdown-item" href="/changePassword">Change Password</a>
                                            <a class="dropdown-item" href="/logout">Log Out</a>
                                            <!--
                                            <form action="/logout" method="post">
                                            </form>
                                            -->
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        <#else>
                            <a class="nav-item" href="/login">Log In</a>
                        </#if>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</#macro>