const fs = require("fs");
const path = require("path");

const cp = function (src, dest) {
  if (fs.existsSync(dest) == false) {
    fs.mkdirSync(dest);
  }

  if (fs.existsSync(src) == false) {
    return false;
  }

  const dirs = fs.readdirSync(src);
  dirs.forEach(function (item) {
    const itemPath = path.join(src, item);
    const temp = fs.statSync(itemPath);
    if (temp.isFile()) {
      fs.copyFileSync(itemPath, path.join(dest, item));
    } else if (temp.isDirectory()) {
      cp(itemPath, path.join(dest, item));
    }
  });
}

cp('./static', "../document-management-web/src/main/resources/static_origin");
