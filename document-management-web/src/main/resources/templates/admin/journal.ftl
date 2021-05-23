<#include "/components/admin-layout.ftl"/>

<@adminLayout currentPage="journal" title="期刊列表 - 文献搜索和管理系统" css=['/css/admin-journal.css']>

    <div id="add-journal-modal" class="ui modal">
        <div class="header">添加期刊</div>
        <div class="content">
            <form id="add-journal-form" class="ui form" method="post">
                <div class="required field">
                    <label>期刊名称</label>
                    <input type="text" name="title">
                </div>
                <div class="required field">
                    <label>所属机构</label>
                    <input name="organizerOffice"/>
                </div>
                <div class="required field">
                    <label>期刊图片</label>
                    <input name="image"/>
                </div>
                <div class="required field">
                    <label>期刊语言</label>
                    <input name="language"/>
                </div>
                <div class="required field">
                    <label>issn</label>
                    <input name="issn"/>
                </div>
                <button class="ui primary button" type="submit">确定</button>
            </form>
        </div>
    </div>


    <div id="bind-entry-modal" class="ui modal">
        <div class="header">绑定词条</div>
        <div class="content">
            <form id="add-journal-form" class="ui form" method="post" action="/admin/journal/entry">
                <input name="id" hidden>
                <div class="field">
                    <label>词条列表（一行一个）</label>
                    <textarea name="entries"></textarea>
                </div>
                <button class="ui primary button" type="submit">确定</button>
            </form>
        </div>
    </div>

    <div id="update-journal-modal" class="ui modal">
        <div class="header">修改期刊</div>
        <div class="content">
            <form id="add-journal-form" class="ui form" method="post">
                <input type="text" name="id" hidden>
                <div class="required field">
                    <label>期刊名称</label>
                    <input type="text" name="title">
                </div>
                <div class="required field">
                    <label>所属机构</label>
                    <input name="organizerOffice"/>
                </div>
                <div class="required field">
                    <label>期刊图片</label>
                    <input name="image"/>
                </div>
                <div class="required field">
                    <label>期刊语言</label>
                    <input name="language"/>
                </div>
                <div class="required field">
                    <label>issn</label>
                    <input name="issn"/>
                </div>
                <button class="ui primary button" type="submit">确定</button>
            </form>
        </div>
    </div>

    <div class="admin-data-header">
        <div>
            <button class="green ui button" id="admin-data-insert"><i class="plus icon"></i> 添加</button>
            <button class="red ui button" id="admin-data-delete-selected"><i class="trash alternate outline icon"></i>
                删除选中
            </button>
        </div>

        <form class="ui action input" action="/admin/journal" method="get">
            <input type="text" name="pageNum" value="${dataPage.pageNum}" hidden>
            <input type="text" name="searchValue" placeholder="搜索..." value="${searchValue!}">
            <select class="ui compact selection dropdown" name="searchKey">
                <option value="title" ${(searchKey! == 'title')?then("selected", "")}>期刊名</option>
                <option value="organizer_office" ${(searchKey! == 'organizer_office')?then("selected", "")}>所属机构
                </option>
                <option value="issn" ${(searchKey! == 'issn')?then("selected", "")}>issn</option>
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
            <th>期刊名</th>
            <th>所属机构</th>
            <th>期刊图片</th>
            <th>ISSN</th>
            <th style="width: 200px">操作</th>
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
                <td data-name="title">${dataItem.title}</td>
                <td data-name="organizerOffice">${dataItem.organizerOffice}</td>
                <td data-name="image">${dataItem.image!}</td>
                <td data-name="language" hidden>${dataItem.language}</td>
                <td data-name="issn">${dataItem.issn}</td>
                <td>
                    <button class="ui button admin-data-bind" data-id="${dataItem.id}">绑定词条</button>
                    <button class="ui button admin-data-update" data-id="${dataItem.id}">修改</button>
                </td>
            </tr>
        </#list>
        </tbody>

        <tfoot>
        <tr>
            <th colspan="6">

                <div class="ui pagination right floated menu">

                    <span class="item header">总记录数：${dataPage.total}</span>

                    <a class="icon item">
                        <i class="left chevron icon ${(dataPage.pageNum gt 1)?then("", "disabled")}"></i>
                    </a>

                    <#if dataPage.pageNum gt 2>
                        <a class="item"
                           href="/admin/journal?pageNum=1&searchValue=${searchValue!}&searchKey=${searchKey!}">1</a>
                    </#if>
                    <#if dataPage.pageNum gt 3>
                        <span class="item">...</span>
                    </#if>
                    <#if dataPage.pageNum gt 1>
                        <a class="item"
                           href="/admin/journal?pageNum=${dataPage.pageNum - 1}&searchValue=${searchValue!}&searchKey=${searchKey!}">${dataPage.pageNum - 1}</a>
                    </#if>
                    <span class="item header">${dataPage.pageNum}</span>
                    <#if dataPage.pageNum lt dataPage.pages >
                        <a class="item"
                           href="/admin/journal?pageNum=${dataPage.pageNum + 1}&searchValue=${searchValue!}&searchKey=${searchKey!}">${dataPage.pageNum + 1}</a>
                    </#if>
                    <#if dataPage.pageNum lt dataPage.pages - 2>
                        <span class="item">...</span>
                    </#if>
                    <#if dataPage.pageNum lt dataPage.pages - 1>
                        <a class="item"
                           href="/admin/journal?pageNum=${dataPage.pages}&searchValue=${searchValue!}&searchKey=${searchKey!}">${dataPage.pages}</a>
                    </#if>

                    <a class="icon item">
                        <i class="right chevron icon ${(dataPage.pageNum lt dataPage.pages)?then("", "disabled")}"></i>
                    </a>

                    <form class="form admin-data-jump-form" action="/admin/journal" method="get">
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

    <script src="/js/admin-journal.js"></script>
</@adminLayout>