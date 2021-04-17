<#include "/components/layout.ftl"/>

<@layout>
    <h1>欢迎您，${currentUser.username}！这里是个人主页。</h1>
    <h2>您的ID是：${currentUser.id.toString()}</h2>
    <h2>您的角色包含：</h2>
    <#list currentUser.roles as role>
        <p>${role.name}</p>
    </#list>

</@layout>
