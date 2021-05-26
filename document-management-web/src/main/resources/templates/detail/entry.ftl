<#include "/components/base-layout.ftl"/>
<#include "/components/search-pane.ftl"/>

<@baseLayout title="词条详情 - 文献搜索和管理系统"  css=["/css/search-pane.css","/css/detail-entry.css"]>
    <@searchPane searchType=searchType searchKey=searchKey searchValue=searchValue />

    <div class="entry-wrapper">
        <main class="main-wrapper ui segment">

            <h1 class="title">${item.name}</h1>

            <div class="ui divider"></div>
            <p class="description">
                <strong>词条描述：</strong>
            <pre style="white-space:pre-wrap; font-family: Lato,'Helvetica Neue',Arial,Helvetica,sans-serif;">${item.description}</pre>
            </p>
        </main>

        <footer class="footer-wrapper ui segment">
            <h2 class="title">相关论文</h2>
            <div class="ui divider"></div>
            <#list paperData as paper>
                <div class="item result-item">
                    <div class="content">
                        <span class="index">${paper_index + 1}.</span>
                        <a class="header" href="/detail/paper?id=${paper.id}">${paper.title}</a>
                        <div class="description">
                            <div>
                                <span class="type">[论文]</span>
                                <a class="author"
                                   href="/result?searchType=paper&searchKey=author&searchValue=${paper.author}">${paper.author}</a>
                                -
                                <a class="author"
                                   href="/result?searchType=paper&searchKey=author_office&searchValue=${paper.authorOffice}">${paper.authorOffice}</a>
                            </div>
                            <div class="abstract">
                                摘要：${paper.paperAbstract!"无"}
                            </div>
                            <div class="keyword">
                                关键字：${paper.keyword}
                            </div>
                        </div>
                    </div>
                </div>
            </#list>
        </footer>

        <footer class="footer-wrapper ui segment">
            <h2 class="title">相关期刊</h2>
            <div class="ui divider"></div>
            <div class="box-wrapper">
                <#list journalData as journal>
                    <div class="box"
                         style="background: url(${journal.image}) center/cover ;display: flex;flex-direction: column;justify-content: flex-end;align-items: center">
                        <div style="padding: 30px 20px;line-height: 24px;text-align: center;background-color: rgba(22,21,21,.6); width: 100%;border-radius: 5px">
                            <a href="/detail/journal?id=${journal.id}" style="font-size: 24px">${journal.title}</a>
                        </div>
                    </div>
                </#list>
            </div>
        </footer>
    </div>


</@baseLayout>
