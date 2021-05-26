<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title>注册 - 文献搜索和管理系统</title>

    <link rel="icon" type="image/png" href="/images/favicon.png"/>
    <link rel="stylesheet" type="text/css" href="/css/semantic.css">
    <link href="https://cdn.bootcdn.net/ajax/libs/toastr.js/latest/css/toastr.min.css" rel="stylesheet">
    <link rel='stylesheet' type="text/css" href='https://cdn.bootcdn.net/ajax/libs/nprogress/0.2.0/nprogress.min.css'/>

    <script type="text/javascript" src="https://cdn.bootcdn.net/ajax/libs/jquery/3.1.1/jquery.slim.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcdn.net/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>
    <script type="text/javascript" src='https://cdn.bootcdn.net/ajax/libs/nprogress/0.2.0/nprogress.min.js'></script>
    <script src="https://cdn.bootcdn.net/ajax/libs/toastr.js/latest/js/toastr.min.js"></script>

    <style type="text/css">
        body {
            background-color: #DADADA;
        }

        body > .grid {
            height: 100%;
        }

        .image {
            margin-top: -100px;
        }

        .column {
            max-width: 450px;
        }
    </style>

</head>
<body>

<script>
    NProgress.start();
    window.onload = function () {
        NProgress.done();
    }
</script>

<div class="ui middle aligned center aligned grid">
    <div class="column">
        <h2 class="ui primary header">
            <div class="content">
                注册
            </div>
        </h2>
        <form id="register-form" class="ui large form ${(error! != '')?then('error', '')}" action="/reg" method="post">
            <div class="ui error message">
                <p>${error!}</p>
            </div>
            <div class="ui stacked segment">
                <div class="field">
                    <div class="ui left icon input">
                        <i class="user icon"></i>
                        <input type="text" name="username" placeholder="用户名">
                    </div>
                </div>
                <div class="field">
                    <div class="ui left icon input">
                        <i class="lock icon"></i>
                        <input type="password" name="password" placeholder="密码">
                    </div>
                </div>

                <div class="field">
                    <div class="ui left icon input">
                        <i class="lock icon"></i>
                        <input type="password" name="repeatPassword" placeholder="重复密码">

                    </div>
                </div>

                <button type="submit" class="ui fluid large primary submit button">注册</button>
            </div>
        </form>

        <div class="ui message">
            已经注册？ <a href="\login">登录</a>
        </div>


    </div>
</div>

<script src="/js/register.js"></script>

</body>


</html>