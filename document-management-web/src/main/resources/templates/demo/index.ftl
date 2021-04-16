<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <title>FreeMarker</title>
  <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css"/>
  <link rel="stylesheet" type="text/css" href="/css/demo.css"/>
</head>
<body>

<table class="table">
  <thead>
  <tr>
    <th scope="col">#</th>
    <th scope="col">用户名</th>
  </tr>
  </thead>

  <tbody>
  <#list users as userItem>
    <tr>
      <th scope="row">${userItem.id}</th>
      <td>${userItem.username}</td>
    </tr>
  </#list>
  </tbody>

</table>

<script src="/js/jquery.slim.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/demo.js"></script>

</body>
</html>