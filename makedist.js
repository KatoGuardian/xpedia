const fs = require("fs");
const rimraf = require("rimraf");
const zipFolder = require('zip-a-folder');

rimraf.sync("dist");
fs.mkdirSync("dist");
fs.mkdirSync("dist/xpedia");
fs.mkdirSync("dist/xpedia/Language");

let files = [
  "xpedia/Language/ru.yml",
  "xpedia/Language/pl.yml",
  "xpedia/Language/cs.yml",
  "xpedia/Language/es-ES.yml",
  "xpedia/images/Dioxine.png",
  "xpedia/images/discord-256.png",
  "xpedia/images/Emerald.png",
  "xpedia/images/FG4SCQ58YFXV.jpg",
  "xpedia/images/Meridian.png",
  "xpedia/images/screen035.png",
  "xpedia/images/screen064.png",
  "xpedia/images/screen135.png",
  "xpedia/images/screen164.png",
  "xpedia/images/screen226.png",
  "xpedia/images/screen692.png",
  "xpedia/images/screen757.png",
  "xpedia/images/screen789.png",
  "xpedia/images/screen1209.png",
  "xpedia/images/screen1325.png",
  "xpedia/images/Title.png",
  "xpedia/images/TX.png",
  "xpedia/images/vk-256.png",
  "xpedia/images/warning.png",
  "xpedia/images/XPZ.png",
  "xpedia/bundle.js",
  "xpedia/bundle.css",
  "xpedia/global.css",
  "xpedia/favicon.png",
  "xpedia/bulmaswatch.min.css",
  "xpedia/0.png",
  "xpedia/xpedia.html.header",
  "xpedia/jszip.min.js",
  "xpedia/spinner.svg",
  "xpedia/Calibri.woff",
  "xpedia.js",
  "xpedia.bat",
  "XPEDIA_README.txt"
];

for (let i = 0; i < files.length; ++i) {
  fs.copyFileSync("public/" + files[i], "dist/" + files[i])
}

// zipFolder.zipFolder('dist', 'xpedia.zip', err=> {if(err) console.log(err)})