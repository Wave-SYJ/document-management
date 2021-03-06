<#include "/components/base-layout.ftl"/>
<#include "/components/search-pane.ftl"/>

<@baseLayout title="主页 - 文献搜索和管理系统" css=["/css/search-pane.css", "/css/index.css"]>

    <@searchPane searchType=searchType searchKey=searchKey searchValue=searchValue />

    <main class="segment-wrapper">
        <div class="ui segment" style="margin-right: 20px;">

            <div class="ui header">最新论文</div>

            <div class="ui list">
                <#list dataPage as dataItem>
                    <div class="item">
                        <i class="map marker icon"></i>
                        <div class="content">
                            <a href="/detail/paper?id=${dataItem.id}" class="header"> ${dataItem.title} </a>
                            <div class="description">
                                ${dataItem.paperAbstract!}
                            </div>
                        </div>
                    </div>
                    <#if dataItem_index==4>
                        <#break>
                    </#if>
                </#list>
            </div>


        </div>

        <div class="ui segment">
            <div class="ui header">最新通知</div>
            <div class="ui list">
                <#list announcementPage as announcementItem>
                    <div class="item">
                        <i class="map marker icon"></i>
                        <div class="content">
                            <span class="header"> ${announcementItem.publishTime?string('yyyy-MM-dd HH:mm:ss')} </span>
                            <div class="description">
                                ${announcementItem.content}
                            </div>
                        </div>
                    </div>
                    <#if announcementItem_index==4>
                        <#break>
                    </#if>
                </#list>
            </div>
        </div>

    </main>

    <script src="/js/index.js"></script>
</@baseLayout>
