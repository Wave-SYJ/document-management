<#include "/components/base-layout.ftl"/>
<#include "/components/search-pane.ftl"/>

<@baseLayout title="搜索结果 - 文献搜索和管理系统" css=["/css/search-pane.css", "/css/result.css"]>

    <@searchPane searchType=searchType searchKey=searchKey searchValue=searchValue />

    <div id="result-panel" class="ui divided items segment">
        <#list dataPage.list as dataItem>
            <div class="item result-item">
                <#if searchType='paper'>
                    <div class="content">
                        <span class="index">${dataItem_index + 1}.</span>
                        <a class="header" href="/detail/paper?id=${dataItem.id}">${dataItem.title}</a>
                        <div class="description">
                            <div>
                                <span class="type">[论文]</span>
                                <a class="author"
                                   href="/result?searchType=paper&searchKey=author&searchValue=${dataItem.author}">${dataItem.author}</a>
                                -
                                <a class="author"
                                   href="/result?searchType=paper&searchKey=author_office&searchValue=${dataItem.authorOffice}">${dataItem.authorOffice}</a>
                            </div>
                            <div class="abstract">
                                摘要：${dataItem.paperAbstract!"无"}
                            </div>
                            <div class="keyword">
                                关键字：${dataItem.keyword}
                            </div>
                        </div>
                    </div>
                </#if>
                <#if searchType='journal'>
                    <div class="content">
                        <span class="index">${dataItem_index + 1}.</span> <a class="header" href="/detail/journal?id=${dataItem.id}">${dataItem.title}</a>
                        <div class="description">
                            <div>
                                <span class="type">[期刊]</span>
                                <a class="author"
                                   href="/result?searchType=journal&searchKey=organizer_office&searchValue=${dataItem.organizerOffice}">${dataItem.organizerOffice}</a>
                            </div>
                            <div class="language">
                                语言：${dataItem.language!"无"}
                            </div>
                            <div class="issn">
                                ISSN：${dataItem.issn!"无"}
                            </div>
                        </div>
                    </div>
                </#if>
                <#if searchType='entry'>
                    <div class="content">
                        <span class="index">${dataItem_index + 1}.</span> <a class="header" href="/detail/entry?id=${dataItem.id}">${dataItem.name}</a>
                        <div class="description">
                            <div>
                                <span class="type">[词条]</span>
                            </div>
                            <div class="abstract">
                                ${dataItem.description!"无"}
                            </div>
                        </div>
                    </div>
                </#if>
            </div>
        </#list>
    </div>

    <div id="page-menu-wrapper">
        <div id="page-menu" class="ui pagination menu">

            <span class="item header">总记录数：${dataPage.total}</span>

            <a class="icon item">
                <i class="left chevron icon ${(dataPage.pageNum gt 1)?then("", "disabled")}"></i>
            </a>

            <#if dataPage.pageNum gt 2>
                <a class="item" href="/result?pageNum=1&searchValue=${searchValue!}&searchKey=${searchKey!}&searchType=${searchType!}">1</a>
            </#if>
            <#if dataPage.pageNum gt 3>
                <span class="item">...</span>
            </#if>
            <#if dataPage.pageNum gt 1>
                <a class="item"
                   href="/result?pageNum=${dataPage.pageNum - 1}&searchValue=${searchValue!}&searchKey=${searchKey!}&searchType=${searchType!}">${dataPage.pageNum - 1}</a>
            </#if>
            <span class="item header">${dataPage.pageNum}</span>
            <#if dataPage.pageNum lt dataPage.pages >
                <a class="item"
                   href="/result?pageNum=${dataPage.pageNum + 1}&searchValue=${searchValue!}&searchKey=${searchKey!}&searchType=${searchType!}">${dataPage.pageNum + 1}</a>
            </#if>
            <#if dataPage.pageNum lt dataPage.pages - 2>
                <span class="item">...</span>
            </#if>
            <#if dataPage.pageNum lt dataPage.pages - 1>
                <a class="item"
                   href="/result?pageNum=${dataPage.pages}&searchValue=${searchValue!}&searchKey=${searchKey!}&searchType=${searchType!}">${dataPage.pages}</a>
            </#if>

            <a class="icon item">
                <i class="right chevron icon ${(dataPage.pageNum lt dataPage.pages)?then("", "disabled")}"></i>
            </a>

            <form class="form admin-data-jump-form" action="/result" method="get">
                <div class="ui action input mini">
                    <input type="text" name="searchValue" value="${searchValue!}" hidden>
                    <input type="text" name="searchKey" value="${searchKey!}" hidden>
                    <input type="text" name="searchType" value="${searchType!}" hidden>
                    <input type="text" name="pageNum" placeholder="页码...">
                    <button class="ui tiny button" type="submit">跳转</button>
                </div>
            </form>
        </div>
    </div>

</@baseLayout>
