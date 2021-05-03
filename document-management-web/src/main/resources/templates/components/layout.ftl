<#macro layout title="文献搜索和管理系统">
    <!DOCTYPE html>
    <html lang="zh">
    <head>
        <!-- Standard Meta -->
        <meta charset="utf-8"/>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

        <!-- Site Properties -->
        <title>${title}</title>

        <link rel="stylesheet" type="text/css" href="/css/semantic.css">
        <link rel="stylesheet" type="text/css" href="/css/layout.css">


    </head>
    <body>

    <div class="ui fixed menu">
        <div class="ui container">
            <a href="/" class="header item">
                <img class="logo" src="/images/favicon.png" alt="logo">
                文献资源管理系统
            </a>

            <div class="right menu">
                <div class="ui dropdown item">
                    ${currentUser.username}
                    <i class="dropdown icon"></i>
                    <div class="menu">
                        <a class="item" href="/user">个人主页</a>
                        <a class="item" href="/logout">退出</a>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="ui main text container">
        <#nested>
    </div>


    <div class="ui vertical footer segment">
        <div class="ui center aligned container">
            Copyright © 2021 All Rights Reserved
        </div>
    </div>

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