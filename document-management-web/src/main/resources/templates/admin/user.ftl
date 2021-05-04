<#include "/components/admin-layout.ftl"/>

<@adminLayout currentPage="user" title="用户管理 - 文献搜索和管理系统">

    <table class="ui celled table">
        <thead>
        <tr>
            <th>#</th>
            <th>用户名</th>
            <th>权限</th>
        </tr>
        </thead>

        <tbody>
        <#list dataPage.list as dataItem>
            <tr>
                <td>${dataItem_index + 1}</td>
                <td>${dataItem.username}</td>
                <td>
                    <div class="ui blue labels">
                        <#list dataItem.roles as role>
                            <a class="ui label">${role.description}</a>
                        </#list>
                    </div>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>

</@adminLayout>