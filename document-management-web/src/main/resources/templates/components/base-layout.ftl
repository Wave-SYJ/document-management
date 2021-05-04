<#macro baseLayout title="文献搜索和管理系统" css=[]>
    <!DOCTYPE html>
    <html lang="zh">
    <head>
        <!-- Standard Meta -->
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

        <!-- Site Properties -->
        <title>${title}</title>

        <link rel="icon" type="image/png" href="/images/favicon.png"/>
        <link rel="stylesheet" type="text/css" href="/css/semantic.css">
        <link rel="stylesheet" type="text/css" href="/css/base-layout.css">

        <#list css as c>
            <link rel="stylesheet" type="text/css" href="${c}">
        </#list>


    </head>
    <body>

    <div id="layout-top-menu" class="ui fixed menu">
        <a href="/index" class="header item" style="width: 220px">
            <img class="logo" src="/images/favicon.png" alt="logo">
            文献搜索和管理系统
        </a>

        <div class="right menu">
            <div class="ui dropdown item">
                ${currentUser.username}
                <i class="dropdown icon"></i>
                <div class="menu">
                    <a class="item" href="/user">个人主页</a>
                    <a class="item" href="/admin">数据管理</a>
                    <a class="item" href="/logout">退出</a>
                </div>
            </div>
        </div>
    </div>

    <#nested>

    <#--    <div id="layout-footer">-->
    <#--        <div class="ui center aligned container">-->
    <#--            Copyright © 2021 All Rights Reserved-->
    <#--        </div>-->
    <#--    </div>-->


    <script src="/js/jquery-3.1.1.min.js"></script>
    <script src="/js/semantic.js"></script>
    <script>
        $('.ui.dropdown')
            .dropdown()
        ;
    </script>

    </body>

    </html>
</#macro>