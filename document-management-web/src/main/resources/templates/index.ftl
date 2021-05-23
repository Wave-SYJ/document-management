<#include "/components/base-layout.ftl"/>
<#include "/components/search-pane.ftl"/>

<@baseLayout title="主页 - 文献搜索和管理系统" css=["/css/search-pane.css", "/css/index.css"]>

    <@searchPane searchType=searchType searchKey=searchKey searchValue=searchValue />

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
