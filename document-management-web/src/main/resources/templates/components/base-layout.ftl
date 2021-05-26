<#macro baseLayout title="文献搜索和管理系统" css=[]>
    <!DOCTYPE html>
    <html lang="zh">
    <head>
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

        <title>${title}</title>

        <link rel="icon" type="image/png" href="/images/favicon.png"/>
        <link rel="stylesheet" type="text/css" href="/css/semantic.css">
        <link rel="stylesheet" type="text/css" href="/css/base-layout.css">
        <link rel='stylesheet' type="text/css" href='https://cdn.bootcdn.net/ajax/libs/nprogress/0.2.0/nprogress.min.css'/>
        <link href="https://cdn.bootcdn.net/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet">

        <#list css as c>
            <link rel="stylesheet" type="text/css" href="${c}">
        </#list>

        <script type="text/javascript" src='https://cdn.bootcdn.net/ajax/libs/nprogress/0.2.0/nprogress.min.js'></script>
        <script type="text/javascript" src="https://cdn.bootcdn.net/ajax/libs/axios/0.21.1/axios.min.js"></script>
        <script type="text/javascript"  src="https://cdn.bootcdn.net/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="https://cdn.bootcdn.net/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>
        <script src="https://cdn.bootcdn.net/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>
        <script src="https://cdn.bootcdn.net/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    </head>
    <body>

    <script type="text/javascript" src="/js/base-layout.js"></script>

    <div id="layout-top-menu" class="ui borderless fixed menu">
        <a href="/index" class="header item" style="width: 220px">
            <img class="logo" src="/images/favicon.png" alt="logo">
            文献搜索和管理系统
        </a>

        <div class="right menu">
            <div class="ui dropdown item">
                <i class="user icon"></i>
                ${currentUser.username}
                <i class="dropdown icon"></i>
                <div class="menu">
                    <a class="item" href="/user">个人主页</a>
                    <#if isAdmin>
                        <a class="item" href="/admin">数据管理</a>
                    </#if>
                    <div class="ui divider"></div>
                    <a class="item" href="/logout">退出</a>
                </div>
            </div>
        </div>
    </div>

    <div style="padding-top: 55px">
        <#nested>
    </div>

    <script>
        $('.ui.dropdown')
            .dropdown()
        ;
    </script>

    </body>

    </html>
</#macro>