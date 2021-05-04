const path = require('path');
const glob = require('glob');
const webpack = require('webpack')
const { CleanWebpackPlugin } = require('clean-webpack-plugin');
const CopyWebpackPlugin = require("copy-webpack-plugin");
const TerserWebpackPlugin = require("terser-webpack-plugin");

const entry = {}
const outputRoot = path.resolve(__dirname, '../document-management-web/src/main/resources/');
glob.sync(path.resolve(outputRoot, "static_origin/js/**.js")).forEach(file => {
  const path = "static" + file.substr(outputRoot.length + "static_origin/".length);
  entry[path] = file;
});

module.exports = {
  entry: entry,
  output: {
    path: outputRoot,
    filename: '[name]',
  },
  resolve: {
    modules: [
      path.resolve(__dirname, './node_modules')
    ]
  },
  plugins: [
    new CleanWebpackPlugin({ cleanOnceBeforeBuildPatterns: ['./static'] }),
    new CopyWebpackPlugin({
      patterns: [
        { from: "static_ignore", to: "./static" },
      ],
    }),
  ],
  devtool: 'eval-cheap-module-source-map',
  performance: {
    hints: false
  },
  optimization: {
    minimize: true,
    minimizer: [
      new TerserWebpackPlugin({
        extractComments: false,
      }),
    ],
  },
  module: {
    rules: [
      {
        test: /\.m?js$/,
        exclude: /(node_modules|static_ignore)/,
        use: {
          loader: 'babel-loader',
          options: {
            presets: ['@babel/preset-env']
          }
        }
      }
    ]
  }
};