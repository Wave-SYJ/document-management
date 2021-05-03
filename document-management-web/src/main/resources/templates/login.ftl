<!DOCTYPE html>
<html lang="zh">
<head>
    <!-- Standard Meta -->
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">

    <!-- Site Properties -->
    <title>登录 - 文献资源管理系统</title>

    <link rel="stylesheet" type="text/css" href="/css/semantic.css">
    <script src="/js/jquery-3.1.1.min.js"></script>
    <script src="/js/semantic.js"></script>

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

<div class="ui middle aligned center aligned grid">
    <div class="column">
        <h2 class="ui teal image header">
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
                        <input id="remember-me-checkbox" type="checkbox">
                        <label for="remember-me-checkbox" style="cursor: pointer">记住我</label>
                    </div>
                </div>
                <button class="ui fluid large teal submit button">登录</button>
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