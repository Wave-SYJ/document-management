function verify(){
    if($("#pwd1").val()==""||$("#username").val==""){
        alert("用户名或密码不能为空！");
    }else if($("#pwd2").val()==""){
        alert("请输入验证密码！");
    }else if($("#pwd1").val()!=$("#pwd2").val()){
        alert("两次密码输入不一致！");
    }else{
        setTimeout(function () {window.open("/login")}, 1000);
        alert("注册完成！点击跳转到登录页面...");
    }
}

