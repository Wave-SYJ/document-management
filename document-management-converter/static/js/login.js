$('#login-form')
  .form({
    fields: {
      username: { rules: [{ type: 'empty', prompt: '用户名不能为空' }] },
      password: { rules: [{ type: 'empty', prompt: '密码不能为空' }] }
    }
  })
  ;