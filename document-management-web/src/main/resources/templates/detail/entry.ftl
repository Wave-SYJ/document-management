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
                ${item.description}</p>
        </main>


        <footer class="footer-wrapper ui segment">
            <h2 class="title">相关内容：</h2>
            <div class="box-wrapper">
                <div class="box">1</div>
                <div class="box">1</div>
                <div class="box">1</div>
                <div class="box">1</div>
            </div>
        </footer>
    </div>


</@baseLayout>
