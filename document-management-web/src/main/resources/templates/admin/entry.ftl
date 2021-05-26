<#include "/components/admin-layout.ftl"/>

<@adminLayout currentPage="entry" title="词条列表 - 文献搜索和管理系统" css=['/css/admin-entry.css']>


    <div id="add-entry-modal" class="ui modal">
        <div class="header">添加词条</div>
        <div class="content">
            <form id="add-entry-form" class="ui form" method="post">
                <div class="required field">
                    <label>词条名称</label>
                    <input type="text" name="name">
                </div>
                <div class="required field">
                    <label>词条描述</label>
                    <textarea name="description"></textarea>
                </div>
                <button class="ui primary button" type="submit">确定</button>
            </form>
        </div>
    </div>

    <div id="update-entry-modal" class="ui modal">
        <div class="header">修改词条</div>
        <div class="content">
            <form id="add-entry-form" class="ui form" method="post">
                <input type="text" name="id" hidden>
                <div class="required field">
                    <label>词条名称</label>
                    <input type="text" name="name">
                </div>
                <div class="required field">
                    <label>词条描述</label>
                    <textarea name="description"></textarea>
                </div>
                <button class="ui primary button" type="submit">确定</button>
            </form>
        </div>
    </div>

    <div class="admin-data-header">
        <div>
            <button class="green ui button" id="admin-data-insert"><i class="plus icon"></i> 添加</button>
            <button class="red ui button" id="admin-data-delete-selected"><i class="trash alternate outline icon"></i> 删除选中</button>
        </div>

        <form class="ui action input" action="/admin/entry" method="get">
            <input type="text" name="pageNum" value="${dataPage.pageNum}" hidden>
            <input type="text" name="searchValue" placeholder="搜索..." value="${searchValue!}">
            <select class="ui compact selection dropdown" name="searchKey">
                <option value="name" ${(searchKey! == 'name')?then("selected", "")}>词条名称</option>
                <option value="name" ${(searchKey! == 'description')?then("selected", "")}>词条描述</option>
            </select>
            <button class="ui basic button icon" type="submit"><i class="search icon"></i></button>
        </form>
    </div>

    <table class="ui single line fixed celled table">
        <thead>
        <tr>
            <th style="width: 80px">
                <div class="ui checkbox data-item-checkbox-all">
                    <input type="checkbox" class="hidden">
                    <label>#</label>
                </div>
            </th>
            <th class="three wide">词条名称</th>
            <th>词条描述</th>
            <th style="width: 100px">操作</th>
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
                <td data-name="name">${dataItem.name}</td>
                <td data-name="description">${dataItem.description}</td>
                <td>
                    <button class="ui button admin-data-update" data-id="${dataItem.id}">修改</button>
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
                        <i class="left chevron icon ${(dataPage.pageNum gt 1)?then("", "disabled")}"></i>
                    </a>

                    <#if dataPage.pageNum gt 2>
                        <a class="item" href="/admin/entry?pageNum=1&searchValue=${searchValue!}&searchKey=${searchKey!}">1</a>
                    </#if>
                    <#if dataPage.pageNum gt 3>
                        <span class="item">...</span>
                    </#if>
                    <#if dataPage.pageNum gt 1>
                        <a class="item"
                           href="/admin/entry?pageNum=${dataPage.pageNum - 1}&searchValue=${searchValue!}&searchKey=${searchKey!}">${dataPage.pageNum - 1}</a>
                    </#if>
                    <span class="item header">${dataPage.pageNum}</span>
                    <#if dataPage.pageNum lt dataPage.pages >
                        <a class="item"
                           href="/admin/entry?pageNum=${dataPage.pageNum + 1}&searchValue=${searchValue!}&searchKey=${searchKey!}">${dataPage.pageNum + 1}</a>
                    </#if>
                    <#if dataPage.pageNum lt dataPage.pages - 2>
                        <span class="item">...</span>
                    </#if>
                    <#if dataPage.pageNum lt dataPage.pages - 1>
                        <a class="item"
                           href="/admin/entry?pageNum=${dataPage.pages}&searchValue=${searchValue!}&searchKey=${searchKey!}">${dataPage.pages}</a>
                    </#if>

                    <a class="icon item">
                        <i class="right chevron icon ${(dataPage.pageNum lt dataPage.pages)?then("", "disabled")}"></i>
                    </a>

                    <form class="form admin-data-jump-form" action="/admin/entry" method="get">
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



    <script src="/js/admin-entry.js"></script>

</@adminLayout>