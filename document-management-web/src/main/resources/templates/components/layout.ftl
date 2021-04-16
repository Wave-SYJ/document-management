<#macro layout title="文献搜索和管理系统">
    <!DOCTYPE html>
    <html lang="zh">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>${title}</title>

        <link href="/css/bootstrap.min.css" rel="stylesheet">
        <link href="/css/layout.css" rel="stylesheet">
    </head>
    <body>

    <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom shadow-sm">
        <h5 class="my-0 mr-md-auto font-weight-normal"><a class="navbar-brand" style="color: black"
                                                          href="/index">${title}</a></h5>
        <#--    <nav class="my-2 my-md-0 mr-md-3">-->
        <#--      <a class="p-2 text-dark" href="#">Features</a>-->
        <#--      <a class="p-2 text-dark" href="#">Enterprise</a>-->
        <#--      <a class="p-2 text-dark" href="#">Support</a>-->
        <#--      <a class="p-2 text-dark" href="#">Pricing</a>-->
        <#--    </nav>-->
        <div class="dropdown" style="margin-right: .5rem">
            <button class="btn btn-link dropdown-toggle" data-toggle="dropdown"
                    aria-haspopup="true" aria-expanded="false">
                ${currentUser.username}
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="/user">个人主页</a>
            </div>
        </div>

        <a class="btn btn-outline-primary" href="/logout">退出</a>
    </div>


    <main role="main" class="container">
        <#nested>
    </main>


    <script src="/js/jquery.slim.min.js"></script>
    <script src="/js/popper.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>


    </body>
    </html>
</#macro>