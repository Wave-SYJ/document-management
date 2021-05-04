const cp = require('child_process');
cp.exec("npm run convert", (error, stdout, stderr) => {
  if (stderr) {
    console.log(stderr)
    return;
  }
  console.log(stdout);
  console.log("Successfully compiled all scss files.\n")
})
