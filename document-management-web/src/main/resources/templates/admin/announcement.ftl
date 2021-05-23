<#include "/components/admin-layout.ftl"/>

<@adminLayout currentPage="announcement" title="期刊列表 - 文献搜索和管理系统" css=['/css/admin-announcement.css']>
    <div id="add-announcement-modal" class="ui modal">
        <div class="header">发布通知</div>
        <div class="content">
            <form id="add-announcement-form" class="ui form" method="post">
                <div class="required field">
                    <label>通知内容</label>
                    <textarea type="text" name="content"></textarea>
                </div>
                <button class="ui primary button" type="submit">确定</button>
            </form>
        </div>
    </div>

    <div class="admin-data-header">
        <button class="green ui button" id="admin-data-insert"><i class="plus icon"></i> 发布通知</button>
        <button class="red ui button" id="admin-data-delete-selected"><i class="trash alternate outline icon"></i> 删除选中</button>
    </div>

    <table class="ui celled table">
        <thead>
        <tr>
            <th style="width: 80px">
                <div class="ui checkbox data-item-checkbox-all">
                    <input type="checkbox" class="hidden">
                    <label>#</label>
                </div>
            </th>
            <th>通知内容</th>
            <th>发布者</th>
            <th>发布时间</th>
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
                <td>${dataItem.content}</td>
                <td>${usernames[dataItem_index]}</td>
                <td>${dataItem.publishTime?string('yyyy-MM-dd HH:mm:ss')}</td>
            </tr>
        </#list>
        </tbody>

        <tfoot>
        <tr>
            <th colspan="5">

                <div class="ui pagination right floated menu">

                    <span class="item header">总记录数：${dataPage.total}</span>

                    <a class="icon item">
                        <i class="left chevron icon ${(dataPage.pageNum gt 1)?then("", "disabled")}"></i>
                    </a>

                    <#if dataPage.pageNum gt 2>
                        <a class="item" href="/admin/announcement?pageNum=1&searchValue=${searchValue!}&searchKey=${searchKey!}">1</a>
                    </#if>
                    <#if dataPage.pageNum gt 3>
                        <span class="item">...</span>
                    </#if>
                    <#if dataPage.pageNum gt 1>
                        <a class="item"
                           href="/admin/announcement?pageNum=${dataPage.pageNum - 1}&searchValue=${searchValue!}&searchKey=${searchKey!}">${dataPage.pageNum - 1}</a>
                    </#if>
                    <span class="item header">${dataPage.pageNum}</span>
                    <#if dataPage.pageNum lt dataPage.pages >
                        <a class="item"
                           href="/admin/announcement?pageNum=${dataPage.pageNum + 1}&searchValue=${searchValue!}&searchKey=${searchKey!}">${dataPage.pageNum + 1}</a>
                    </#if>
                    <#if dataPage.pageNum lt dataPage.pages - 2>
                        <span class="item">...</span>
                    </#if>
                    <#if dataPage.pageNum lt dataPage.pages - 1>
                        <a class="item"
                           href="/admin/announcement?pageNum=${dataPage.pages}&searchValue=${searchValue!}&searchKey=${searchKey!}">${dataPage.pages}</a>
                    </#if>

                    <a class="icon item">
                        <i class="right chevron icon ${(dataPage.pageNum lt dataPage.pages)?then("", "disabled")}"></i>
                    </a>

                    <form class="form admin-data-jump-form" action="/admin/announcement" method="get">
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

    <script src="/js/admin-announcement.js"></script>
</@adminLayout>