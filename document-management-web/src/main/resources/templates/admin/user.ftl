<#include "/components/admin-layout.ftl"/>

<@adminLayout currentPage="user" title="用户管理 - 文献搜索和管理系统" css=['/css/admin-user.css']>

    <div class="admin-data-header">
        <button class="red ui button" id="admin-data-delete-selected"><i class="trash alternate outline icon"></i> 删除选中</button>

        <form class="ui action input" action="/admin/user" method="get">
            <input type="text" name="pageNum" value="${dataPage.pageNum}" hidden>
            <input type="text" name="searchValue" placeholder="搜索..." value="${searchValue!}">
            <select class="ui compact selection dropdown" name="searchKey">
                <option value="username" ${(searchKey! == 'username')?then("selected", "")}>用户名</option>
            </select>
            <button class="ui basic button icon" type="submit"><i class="search icon"></i></button>
        </form>
    </div>

    <table class="ui celled fixed single line table">
        <thead>
        <tr>
            <th style="width: 80px">
                <div class="ui checkbox data-item-checkbox-all">
                    <input type="checkbox" class="hidden">
                    <label>#</label>
                </div>
            </th>
            <th>用户名</th>
            <th>权限</th>
            <#if isSystemAdmin>
                <th>
                    添加权限
                </th>
            </#if>
        </tr>
        </thead>

        <tbody>
        <#list dataPage.list as dataItem>
            <tr>
                <td>
                    <div class="ui checkbox data-item-checkbox-item">
                        <input type="checkbox" class="hidden" data-index="${dataItem_index}" data-id="${dataItem.id}">
                        <label>${dataItem_index + 1}</label>
                    </div>
                </td>
                <td>${dataItem.username}</td>
                <td>
                    <div class="ui blue labels">
                        <#list dataItem.roles as role>
                            <form action="/admin/role">
                                <input name="userId" value="${dataItem.id}" hidden>
                                <input name="roleName" value="${role.name}" hidden>
                                <input name="add" value="false" hidden>
                                <button class="ui label" type="submit">${role.description}<i class="delete icon"></i></button>
                            </form>

                        </#list>
                    </div>
                </td>
                <#if isSystemAdmin>
                    <td>
                        <form action="/admin/role">
                            <input name="userId" value="${dataItem.id}" hidden>
                            <input name="roleName" value="ROLE_USER_ADMIN" hidden>
                            <input name="add" value="true" hidden>
                            <button class="ui button" type="submit">用户管理员 </button>
                        </form>
                        <form action="/admin/role">
                            <input name="userId" value="${dataItem.id}" hidden>
                            <input name="roleName" value="ROLE_DOCUMENT_ADMIN" hidden>
                            <input name="add" value="true" hidden>
                            <button class="ui button" type="submit">文献管理员 </button>
                        </form>
                        <form action="/admin/role">
                            <input name="userId" value="${dataItem.id}" hidden>
                            <input name="roleName" value="ROLE_SYSTEM_ADMIN" hidden>
                            <input name="add" value="true" hidden>
                            <button class="ui button" type="submit">系统管理员 </button>
                        </form>
                    </td>
                </#if>
            </tr>
        </#list>
        </tbody>

        <tfoot>
        <tr>
            <th colspan="${isSystemAdmin?then(4, 3)}">

                <div class="ui pagination right floated menu">

                    <span class="item header">总记录数：${dataPage.total}</span>

                    <a class="icon item">
                        <i class="left chevron icon ${(dataPage.pageNum gt 1)?then("", "disabled")}"></i>
                    </a>

                    <#if dataPage.pageNum gt 2>
                        <a class="item" href="/admin/user?pageNum=1&searchValue=${searchValue!}&searchKey=${searchKey!}">1</a>
                    </#if>
                    <#if dataPage.pageNum gt 3>
                        <span class="item">...</span>
                    </#if>
                    <#if dataPage.pageNum gt 1>
                        <a class="item"
                           href="/admin/user?pageNum=${dataPage.pageNum - 1}&searchValue=${searchValue!}&searchKey=${searchKey!}">${dataPage.pageNum - 1}</a>
                    </#if>
                    <span class="item header">${dataPage.pageNum}</span>
                    <#if dataPage.pageNum lt dataPage.pages >
                        <a class="item"
                           href="/admin/user?pageNum=${dataPage.pageNum + 1}&searchValue=${searchValue!}&searchKey=${searchKey!}">${dataPage.pageNum + 1}</a>
                    </#if>
                    <#if dataPage.pageNum lt dataPage.pages - 2>
                        <span class="item">...</span>
                    </#if>
                    <#if dataPage.pageNum lt dataPage.pages - 1>
                        <a class="item"
                           href="/admin/user?pageNum=${dataPage.pages}&searchValue=${searchValue!}&searchKey=${searchKey!}">${dataPage.pages}</a>
                    </#if>

                    <a class="icon item">
                        <i class="right chevron icon ${(dataPage.pageNum lt dataPage.pages)?then("", "disabled")}"></i>
                    </a>

                    <form class="form admin-data-jump-form" action="/admin/user" method="get">
                        <div class="ui action input mini">
                            <input type="text" name="searchValue" value="${searchValue!}" hidden>
                            <input type="text" name="searchKey" value="${searchKey!}" hidden>
                            <input type="text" name="pageNum" placeholder="页码...">
                            <button class="ui tiny button" type="submit">跳转</button>
                        </div>
                    </form>

                </div>
            </th>
        </tr>
        </tfoot>
    </table>

    <script src="/js/admin-user.js"></script>

</@adminLayout>