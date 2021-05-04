NProgress.start();
window.onload = function () {
  NProgress.done();
}

axios.interceptors.request.use(config => {
  NProgress.start()
  return config
})

axios.interceptors.response.use(config => {
  NProgress.done()
  return config
})
