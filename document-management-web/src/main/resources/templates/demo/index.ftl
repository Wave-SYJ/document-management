<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>FreeMarker</title>
    <link rel="stylesheet" type="text/css" href="/css/demo.css" />
</head>
<body>

<#list users as item><h1>Hello ${item.username}!</h1></#list>

<script src="/js/demo.js"></script>

</body>
</html>