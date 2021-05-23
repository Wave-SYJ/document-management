<#include "/components/admin-layout.ftl"/>

<@adminLayout currentPage="paper" title="论文列表 - 文献搜索和管理系统" css=['/css/admin-paper.css']>


    <div id="add-paper-modal" class="ui modal">
        <div class="header">添加论文</div>
        <div class="content">
            <form id="add-paper-form" class="ui form" method="post">
                <div class="required field">
                    <label>论文题目</label>
                    <input type="text" name="title">
                </div>
                <div class="required field">
                    <label>作者</label>
                    <input type="text" name="author">
                </div>
                <div class="required field">
                    <label>作者单位</label>
                    <input type="text" name="authorOffice">
                </div>
                <div class="required field">
                    <label>论文摘要</label>
                    <textarea name="paperAbstract"></textarea>
                </div>
                <div class="required field">
                    <label>论文关键字</label>
                    <textarea name="keyword"></textarea>
                </div>
                <div class="required field">
                    <label>所属期刊</label>
                    <input type="text" name="journalId">
                </div>
                <div class="required field">
                    <label>发表时间</label>
                    <input type="text" name="publishTime">
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


        <form class="ui action input" action="/admin/paper" method="get">
            <input type="text" name="pageNum" value="${dataPage.pageNum}" hidden>
            <input type="text" name="searchValue" placeholder="搜索..." value="${searchValue!}">
            <select class="ui compact selection dropdown" name="searchKey">
                <option value="title" ${(searchKey! == 'title')?then("selected", "")}>题名</option>
                <option value="author" ${(searchKey! == 'author')?then("selected", "")}>作者</option>
                <option value="author_office" ${(searchKey! == 'author_office')?then("selected", "")}>作者单位</option>
                <option value="keyword" ${(searchKey! == 'keyword')?then("selected", "")}>关键字</option>
                <option value="abstract" ${(searchKey! == 'abstract')?then("selected", "")}>摘要</option>

            </select>
            <button class="ui basic button icon" type="submit"><i class="search icon"></i></button>
        </form>
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
            <th>题名</th>
            <th>作者</th>
            <th>摘要</th>
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
                <td>${dataItem.title!}</td>
                <td>${dataItem.author!}</td>
                <td>${dataItem.paperAbstract!}</td>

            </tr>
        </#list>
        </tbody>

        <tfoot>
        <tr>
            <th colspan="4">

                <div class="ui pagination right floated menu">

                    <span class="item header">总记录数：${dataPage.total}</span>

                    <a class="icon item">
                        <i class="left chevron icon ${(dataPage.pageNum gt 1)?then("", "disabled")}"></i>
                    </a>

                    <#if dataPage.pageNum gt 2>
                        <a class="item" href="/admin/paper?pageNum=1&searchValue=${searchValue!}&searchKey=${searchKey!}">1</a>
                    </#if>
                    <#if dataPage.pageNum gt 3>
                        <span class="item">...</span>
                    </#if>
                    <#if dataPage.pageNum gt 1>
                        <a class="item"
                           href="/admin/paper?pageNum=${dataPage.pageNum - 1}&searchValue=${searchValue!}&searchKey=${searchKey!}">${dataPage.pageNum - 1}</a>
                    </#if>
                    <span class="item header">${dataPage.pageNum}</span>
                    <#if dataPage.pageNum lt dataPage.pages >
                        <a class="item"
                           href="/admin/paper?pageNum=${dataPage.pageNum + 1}&searchValue=${searchValue!}&searchKey=${searchKey!}">${dataPage.pageNum + 1}</a>
                    </#if>
                    <#if dataPage.pageNum lt dataPage.pages - 2>
                        <span class="item">...</span>
                    </#if>
                    <#if dataPage.pageNum lt dataPage.pages - 1>
                        <a class="item"
                           href="/admin/paper?pageNum=${dataPage.pages}&searchValue=${searchValue!}&searchKey=${searchKey!}">${dataPage.pages}</a>
                    </#if>

                    <a class="icon item">
                        <i class="right chevron icon ${(dataPage.pageNum lt dataPage.pages)?then("", "disabled")}"></i>
                    </a>

                    <form class="form admin-data-jump-form" action="/admin/paper" method="get">
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

    <script src="/js/admin-paper.js"></script>

</@adminLayout>