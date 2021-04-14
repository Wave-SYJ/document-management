const cp = require('child_process');
cp.exec("npm run convert", (error, stdout) => {
  if (error) {
    console.error(error);
    return;
  }
  console.log(stdout);
  console.log("Successfully compiled all scss files.\n")
})