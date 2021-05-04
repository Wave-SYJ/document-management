<#include "/components/base-layout.ftl" />

<#macro adminLayout currentPage css=[] title="">
    <@baseLayout title=title css=["/css/admin-layout.css"]+css>

        <div id="admin-layout-sidebar" class="ui left fixed vertical menu">
            <#list currentUser.roles as role>
                <#if role.name == "ROLE_USER_ADMIN">
                    <div class="item">
                        <div class="header">用户</div>
                        <div class="menu">
                                <a class="${(currentPage == "user")?then('item active', 'item')}"> 用户管理 </a>
                        </div>
                    </div>
                <#elseif role.name == "ROLE_DOCUMENT_ADMIN">
                    <div class="item">
                        <div class="header">文献</div>
                        <div class="menu">
                            <a class="${(currentPage == "paper")?then('item active', 'item')}"> 论文列表 </a>
                            <a class="${(currentPage == "journal")?then('item active', 'item')}"> 期刊列表 </a>
                            <a class="${(currentPage == "entry")?then('item active', 'item')}"> 词条列表 </a>
                        </div>
                    </div>
                <#elseif role.name == "ROLE_SYSTEM_ADMIN">
                    <div class="item">
                        <div class="header"> 系统</div>
                        <div class="menu">
                            <a class="${(currentPage == "system")?then('item active', 'item')}"> 系统管理 </a>
                        </div>
                    </div>
                </#if>
            </#list>
        </div>

    </@baseLayout>

    <div id="admin-layout-content">
        <#nested>
    </div>
</#macro>