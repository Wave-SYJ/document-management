<#include "/components/user-layout.ftl"/>

<@userLayout currentPage="password" title="修改密码 - 文献搜索和管理系统" css=['/css/user-password.css']>

    <div class="user-password-wrapper">
        <div class="ui segment">
            <form class="ui form" action="/user/password" method="post">
                <div class="field">
                    <label>原密码</label>
                    <input type="password" name="oldPassword" placeholder="请输入原密码...">
                </div>
                <div class="field">
                    <label>新密码</label>
                    <input type="password" name="newPassword" placeholder="请输入新密码...">
                </div>
                <div class="field">
                    <label>重复密码</label>
                    <input type="password" name="repeatPassword" placeholder="请再输入一遍新密码...">
                </div>
                <button class="ui button" type="submit">保存</button>
            </form>
        </div>
    </div>

</@userLayout>
