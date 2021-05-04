<#include "/components/admin-layout.ftl"/>

<@adminLayout currentPage="user" title="用户管理 - 文献搜索和管理系统">

    <div class="admin-data-header">
        <button class="green ui button"><i class="add icon"></i>增添</button>
        <button class="red ui button"><i class="trash alternate outline icon"></i> 删除选中</button>
    </div>

    <table class="ui celled table">
        <thead>
        <tr>
            <th style="width: 60px">
                <div class="ui checkbox data-item-checkbox-all">
                    <input type="checkbox" class="hidden">
                    <label>#</label>
                </div>
            </th>
            <th>用户名</th>
            <th>权限</th>
        </tr>
        </thead>

        <tbody>
        <#list dataPage.list as dataItem>
            <tr>
                <td>
                    <div class="ui checkbox data-item-checkbox-item" data-index="${dataItem_index}" data-id="${dataItem.id}">
                        <input type="checkbox" class="hidden">
                        <label>${dataItem_index + 1}</label>
                    </div>
                </td>
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

        <tfoot>
        <tr>
            <th colspan="3">

                <div class="ui pagination right floated menu">

                    <span class="item header">总记录数：${dataPage.total}</span>

                    <a class="icon item">
                        <i class="left chevron icon"></i>
                    </a>

                    <#if dataPage.pageNum gt 2><a class="item">1</a></#if>
                    <#if dataPage.pageNum gt 3><a class="item">...</a></#if>
                    <#if dataPage.pageNum gt 1><a class="item">${dataPage.pageNum - 1}</a></#if>
                    <a class="item">${dataPage.pageNum}</a>
                    <#if dataPage.pageNum lt dataPage.pages - 1><a class="item">${dataPage.pageNum + 1}</a></#if>
                    <#if dataPage.pageNum lt dataPage.pages - 3><a class="item">...</a></#if>
                    <#if dataPage.pageNum lt dataPage.pages - 2><a class="item">${dataPage.pages}</a></#if>

                    <a class="icon item">
                        <i class="right chevron icon"></i>
                    </a>
                </div>
            </th>
        </tr>
        </tfoot>
    </table>

    <script src="/js/admin-data.js"></script>

</@adminLayout>