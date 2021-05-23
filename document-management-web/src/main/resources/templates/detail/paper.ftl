<#include "/components/base-layout.ftl"/>
<#include "/components/search-pane.ftl"/>

<@baseLayout title="文献详情 - 文献搜索和管理系统" css=["/css/detail-paper.css","/css/search-pane.css","/css/result.css"]>

    <@searchPane searchType=searchType searchKey=searchKey searchValue=searchValue />

    <div class="ui divided items segment paper-wrapper" style="margin: 0 auto 20px;font-size: 18px">
        <div style="display: flex;align-items: center">
            <h2 style="color: #5a9cd6;fontsize:28px;margin: 4px 0">论文详情</h2>
            <div class="ui labeled button" tabindex="0" style="margin-left: 20px">
                <div class="ui button">
                    <i class="heart icon"></i> 收藏
                </div>
            </div>
        </div>
        <div class="ui divider"></div>
        <p>论文标题：${item.title}</p>
        <p>论文作者：${item.author}</p>
        <p>作者单位：${item.authorOffice}</p>
        <p>关键字：${item.keyword}</p>
        <p>论文摘要：${item.paperAbstract}</p>
        <p>下载链接</p>
        <a href=${item.url!""}>
            <svg t="1621781504950" class="icon" viewBox="0 0 1024 1024" version="1.1"
                 xmlns="http://www.w3.org/2000/svg"
                 p-id="2508" width="100" height="100">
                <path d="M222.3104 128h471.488c10.3808 0 20.3008 4.352 27.4304 12.032l164.48 175.2704a38.784 38.784 0 0 1 10.2912 26.368V800c0 53.0176-42.2272 96-94.3104 96H222.3104C170.24 896 128 853.0176 128 800v-576c0-53.0176 42.2272-96 94.3104-96z"
                      fill="#EDEDED" p-id="2509"></path>
                <path d="M630.2464 555.904c-7.8848 0-15.7824 0-24.32 1.9712 8.5376 4.5824 18.4064 5.888 27.6096 7.2064 5.9136 0.6528 13.1456 0 18.4064-1.9584 0.6528-2.624-3.2896-7.2064-21.696-7.2064m-126.8736-49.1264l-0.6656 1.9584-0.64-0.6528c-7.8976 21.6192-17.7664 42.5728-27.6224 62.8864l1.9712-0.6656v1.9712c20.3776-7.2064 42.7264-14.4128 63.104-18.3424l-0.64-0.6528h2.624c-15.1296-15.0656-27.6096-31.4368-38.144-46.5024m-6.5664-134.272h-2.624c-0.6528 0-2.6368 0-3.2896 0.64-3.2896 15.7312-0.6528 32.768 5.248 47.168a79.1936 79.1936 0 0 0 0.6656-47.808M373.2096 650.24l2.624-0.6656c13.1584-4.5824 23.0144-14.4128 30.8992-25.536-13.7984 5.2352-25.6384 14.4128-33.5232 26.2016m260.3264-56.9856c-24.9856-1.9712-48.64-11.7888-68.3776-27.52-38.1184 7.8592-74.9312 20.3136-110.4384 35.3792C426.4576 652.1984 398.848 678.4 375.8336 678.4c-4.608 0-10.5088-0.6528-14.464-3.2768C350.8736 670.5408 345.6 660.0576 345.6 650.24c0-7.872 1.9712-32.1024 90.0608-69.44a631.296 631.296 0 0 0 48.64-115.2768c-11.8272-22.272-35.4944-77.2864-18.4064-104.8064 5.2608-10.4704 17.1008-15.7184 28.2752-15.0656 8.5376 0 18.4064 4.5952 23.6672 12.4544 12.4928 17.024 11.8272 52.3904-4.608 103.488a303.872 303.872 0 0 0 57.856 74.6752c19.712-3.2768 38.784-5.9008 58.496-5.9008 43.392 0.6528 49.9712 21.6192 48.6528 33.408 1.9712 29.4784-28.2624 29.4784-44.6976 29.4784"
                      fill="#F19595" p-id="2510"></path>
                <path d="M713.344 132.4416l176.128 188.48a12.8 12.8 0 0 1-9.3568 21.5424H742.4a51.2 51.2 0 0 1-51.2-51.2V141.184a12.8 12.8 0 0 1 22.144-8.7424z"
                      fill="#DCDCDC" p-id="2511"></path>
            </svg>
        </a>
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
