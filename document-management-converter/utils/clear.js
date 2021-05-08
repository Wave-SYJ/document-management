const fs = require("fs");
const path = require("path");

const rmdir = function (dir) {
  if (!fs.existsSync(dir) || !fs.statSync(dir).isDirectory())
    return;

  const list = fs.readdirSync(dir);
  for (let i = 0; i < list.length; i++) {
    const filename = path.join(dir, list[i]);
    const stat = fs.statSync(filename);

    if (filename == "." || filename == "..") {
    } else if (stat.isDirectory()) {
      rmdir(filename);
    } else {
      fs.unlinkSync(filename);
    }
  }
  fs.rmdirSync(dir);
};

rmdir("../document-management-web/src/main/resources/static");
rmdir("../document-management-web/src/main/resources/static_origin");
