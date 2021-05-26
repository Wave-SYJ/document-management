<#include "/components/base-layout.ftl"/>
<#include "/components/search-pane.ftl"/>

<@baseLayout title="期刊详情 - 文献搜索和管理系统" css=["/css/detail-journal.css","/css/search-pane.css","/css/result.css"]>

    <@searchPane searchType=searchType searchKey=searchKey searchValue=searchValue />

    <div class="ui divided items segment journal-wrapper" style="margin: 0 auto 20px;">
        <div style="display: flex;align-items: center">
            <h2 style="color: #5a9cd6;fontsize:28px;margin: 4px 0">期刊详情</h2>
            <div tabindex="0" style="margin-left: 20px">
                <#if isSubscribed==true>
                    <form action="/detail/journal/cancelSubscribed" method="get">
                        <input type="text" name="journal_id" value="${item.id}" hidden>
                        <button class="ui button gery" type="submit"><i class="heart icon"></i> 已订阅</button>
                    </form>
                <#else>
                    <form action="/detail/journal/subscribed" method="get">
                        <input type="text" name="journal_id" value="${item.id}" hidden>
                        <button class="ui button " type="submit"><i class="heart icon"></i> 订阅</button>
                    </form>
                </#if>
            </div>
        </div>
        <div class="ui divider"></div>
        <div class="content-wrapper">
            <aside style="flex: 0 1 30%">
                <img style="width: 100%;padding: 20px;" src=${item.image}>
            </aside>
            <main class="main-wrapper" style="flex: 0 1 60%;padding:20px">
                <h3>期刊名称：${item.title}</h3>
                <h3>期刊机构：${item.organizerOffice} </h3>
                <h3>期刊语言：${item.language} </h3>
                <h3>ISSN代码：${item.issn} </h3>
            </main>
        </div>
    </div>

    <div id="result-panel" class="ui divided items segment">
        <h2 style="color: #5a9cd6;fontsize:28px">相关论文</h2>
        <#list paperList.list as dataItem>
            <div class="item result-item">
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
            </div>
        </#list>
    </div>


</@baseLayout>
