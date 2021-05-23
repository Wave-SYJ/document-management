<#include "/components/base-layout.ftl"/>

<@baseLayout title="主页 - 文献搜索和管理系统" css=["/css/index.css"]>

    <div id="search-pane">

        <div id="search-pane-type-menu" class="ui secondary menu">
            <a class="item ${(searchType! == "paper")?then('active', '')}" data-type="paper" href="/index?searchType=paper"> 论文 </a>
            <a class="item ${(searchType! == "journal")?then('active', '')}" data-type="journal" href="/index?searchType=journal"> 期刊 </a>
            <a class="item ${(searchType! == "entry")?then('active', '')}" data-type="entry"  href="/index?searchType=entry"> 词条 </a>
        </div>

        <form id="search-input" class="ui action input" action="/result" method="get">
            <input type="text" name="searchType" style="display: none" value="${searchType!}">
            <input type="text" placeholder="搜索..." name="searchValue" value="${searchValue!}">
            <select class="ui selection dropdown" name="searchKey">
                <#if searchType='paper'>
                    <option value="title" ${(searchKey! == 'title')?then("selected", "")}>题名</option>
                    <option value="author" ${(searchKey! == 'author')?then("selected", "")}>作者</option>
                    <option value="author_office" ${(searchKey! == 'author-office')?then("selected", "")}>作者单位</option>
                    <option value="keyword" ${(searchKey! == 'keyword')?then("selected", "")}>关键词</option>
                    <option value="abstract" ${(searchKey! == 'abstract')?then("selected", "")}>摘要</option>
                </#if>
                <#if searchType='journal'>
                    <option value="title" ${(searchKey! == 'title')?then("selected", "")}>题名</option>
                    <option value="organizer_office" ${(searchKey! == 'organizer_office')?then("selected", "")}>所属机构</option>
                    <option value="author-issn" ${(searchKey! == 'issn')?then("selected", "")}>ISSN</option>
                </#if>
                <#if searchType='entry'>
                    <option value="title" ${(searchKey! == 'title')?then("selected", "")}>标题</option>
                    <option value="description" ${(searchKey! == 'organizer_office')?then("selected", "")}>描述</option>
                </#if>
            </select>
            <button class="ui button primary" type="submit">搜索</button>
        </form>

    </div>

    <main class="segment-wrapper">
        <div class="ui segment" style="margin-right: 20px;">
            <div class="ui header">最新论文</div>

            <div class="ui list">
                <div class="item">
                    <i class="map marker icon"></i>
                    <div class="content">
                        <a class="header">Krolewskie Jadlo</a>
                        <div class="description">An excellent polish restaurant, quick delivery and hearty, filling
                            meals.
                        </div>
                    </div>
                </div>
                <div class="item">
                    <i class="map marker icon"></i>
                    <div class="content">
                        <a class="header">Xian Famous Foods</a>
                        <div class="description">A taste of Shaanxi's delicious culinary traditions, with delights
                            like
                            spicy cold noodles and lamb burgers.
                        </div>
                    </div>
                </div>
                <div class="item">
                    <i class="map marker icon"></i>
                    <div class="content">
                        <a class="header">Sapporo Haru</a>
                        <div class="description">Greenpoint's best choice for quick and delicious sushi.</div>
                    </div>
                </div>
                <div class="item">
                    <i class="map marker icon"></i>
                    <div class="content">
                        <a class="header">Enid's</a>
                        <div class="description">At night a bar, during the day a delicious brunch spot.</div>
                    </div>
                </div>
                <div class="item">
                    <i class="map marker icon"></i>
                    <div class="content">
                        <a class="header">Enid's</a>
                        <div class="description">At night a bar, during the day a delicious brunch spot.</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="ui segment">
            <div class="ui header">最新通知</div>
        </div>

    </main>

    <script src="/js/index.js"></script>
</@baseLayout>
