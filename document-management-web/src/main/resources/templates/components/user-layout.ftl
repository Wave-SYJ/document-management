<#include "/components/base-layout.ftl" />

<#macro userLayout currentPage css=[] title="">
    <@baseLayout title=title css=["/css/user-layout.css"]+css>

        <div id="user-layout-sidebar" class="ui secondary vertical pointing menu">
            <a class="item ${(currentPage == "basic")?then('active', '')}" href="/user/basic"> 基本信息 </a>
            <a class="item ${(currentPage == "favorite")?then('active', '')}" href="/admin/collection"> 我的收藏 </a>
            <a class="item ${(currentPage == "subscription")?then('active', '')}"> 我的订阅 </a>
            <a class="item ${(currentPage == "favorite")?then('active', '')}"> 我的收藏 </a>
            <a class="item ${(currentPage == "subscription")?then('active', '')}" href="/admin/subscription"> 我的订阅 </a>
            <a class="item ${(currentPage == "collection")?then('active', '')}" href="/user/collection"> 我的收藏 </a>
            <a class="item ${(currentPage == "subscription")?then('active', '')}" href="/user/subscription"> 我的订阅 </a>

            <a class="item ${(currentPage == "password")?then('active', '')}"  href="/user/password"> 修改密码 </a>
        </div>

    </@baseLayout>

    <div id="user-layout-content">
        <#nested>
    </div>
</#macro>