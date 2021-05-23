<#macro searchPane searchType searchKey searchValue>
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
</#macro>