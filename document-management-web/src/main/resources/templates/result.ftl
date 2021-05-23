<#include "/components/base-layout.ftl"/>
<#include "/components/search-pane.ftl"/>

<@baseLayout title="搜索结果 - 文献搜索和管理系统" css=["/css/search-pane.css", "/css/result.css"]>

<@searchPane searchType=searchType searchKey=searchKey searchValue=searchValue />



</@baseLayout>
