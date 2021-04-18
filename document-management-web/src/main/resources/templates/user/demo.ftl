<#include "/components/layout.ftl"/>

<@layout title="hehehe">
    <form action="/register" method="post">
        <div class="form-group">
            <label for="exampleInputEmail1">Username</label>
            <input name="username" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
        </div>
        <div class="form-group">
            <label for="exampleInputPassword1">Password</label>
            <input name="password" type="password" class="form-control" id="exampleInputPassword1">
        </div>
        <button type="submit" class="btn btn-primary">Register</button>
    </form>
</@layout>
