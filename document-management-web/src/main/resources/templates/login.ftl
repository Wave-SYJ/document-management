<!doctype html>
<html lang="zh">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>登录</title>


  <!-- Bootstrap core CSS -->
  <link href="/css/bootstrap.min.css" rel="stylesheet">


  <style>
      .bd-placeholder-img {
          font-size: 1.125rem;
          text-anchor: middle;
          -webkit-user-select: none;
          -moz-user-select: none;
          -ms-user-select: none;
          user-select: none;
      }

      @media (min-width: 768px) {
          .bd-placeholder-img-lg {
              font-size: 3.5rem;
          }
      }
  </style>


  <!-- Custom styles for this template -->
  <link href="/css/login.css" rel="stylesheet">
</head>
<body class="text-center">

<form class="form-signin" action="/auth" method="post">

    <#if RequestParameters.error??>
      <div class="alert alert-danger alert-dismissible fade show" role="alert">
        用户名或密码错误，请重试。
        <button type="button" class="close" data-dismiss="alert" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
    </#if>

  <img class="mb-4" src="/img/bootstrap-solid.svg" alt="" width="72" height="72">
  <h1 class="h3 mb-3 font-weight-normal">Please Login</h1>
  <label for="inputUsername" class="sr-only">Username</label>
  <input id="inputUsername" class="form-control" placeholder="Username" required autofocus name="username">
  <label for="inputPassword" class="sr-only">Password</label>
  <input type="password" id="inputPassword" class="form-control" placeholder="Password" required name="password">
    <#--  <div class="checkbox mb-3">-->
    <#--    <label>-->
    <#--      <input type="checkbox" value="remember-me"> Remember me-->
    <#--    </label>-->
    <#--  </div>-->
  <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
  <p class="mt-5 mb-3 text-muted">Copyright &copy; ${.now?string('yyyy')} All Rights Reserved</p>
</form>

<script src="/js/jquery.slim.min.js"></script>
<script src="/js/bootstrap.min.js"></script>

</body>
</html>
