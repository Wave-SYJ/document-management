<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <title>登录 - 文献资源管理系统</title>

    <link rel="icon" type="image/png" href="/images/favicon.png"/>
    <link rel="stylesheet" type="text/css" href="/css/semantic.css">

    <link rel='stylesheet' type="text/css" href='https://unpkg.com/nprogress@0.2.0/nprogress.css'/>
    <script type="text/javascript"  src="https://cdn.bootcdn.net/ajax/libs/jquery/3.1.1/jquery.slim.min.js"></script>
    <script type="text/javascript" src="https://cdn.bootcdn.net/ajax/libs/semantic-ui/2.4.1/semantic.min.js"></script>
    <script type="text/javascript" src='https://unpkg.com/nprogress@0.2.0/nprogress.js'></script>

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
    window.onload = function() {
        NProgress.done();
    }
</script>

<div class="ui middle aligned center aligned grid">
    <div class="column">
        <h2 class="ui primary header">
            <div class="content">
                登录
            </div>
        </h2>
        <form class="ui large form" action="/auth" method="post">
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
                    <div class="ui checkbox">
                        <input id="remember-me-checkbox" type="checkbox" name="remember-me">
                        <label for="remember-me-checkbox" style="cursor: pointer">记住我</label>
                    </div>
                </div>
                <button class="ui fluid large primary submit button">登录</button>
            </div>

            <div class="ui error message"></div>

        </form>

        <div class="ui message">
            没有账号？ <a href="#">注册</a>
        </div>
    </div>
</div>

</body>

</html>