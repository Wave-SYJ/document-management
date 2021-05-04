const path = require('path');
const glob = require('glob');
const webpack = require('webpack')
const { CleanWebpackPlugin } = require('clean-webpack-plugin');
const CopyWebpackPlugin = require("copy-webpack-plugin");
const TerserWebpackPlugin = require("terser-webpack-plugin");
const HotModuleReplacementPlugin = webpack.HotModuleReplacementPlugin;

const entry = {}
glob.sync("./static/js/**.js").forEach(file => entry[file] = file);
const outputDir = path.resolve(__dirname, '../document-management-web/src/main/resources/');

module.exports = {
  entry: entry,
  output: {
    path: outputDir,
    filename: '[name]',
  },
  plugins: [
    new CleanWebpackPlugin({ cleanOnceBeforeBuildPatterns: ['./static'] }),
    new HotModuleReplacementPlugin(),
    new CopyWebpackPlugin({
      patterns: [
        { from: "static_ignore", to: "./static" },
      ],
    }),
  ],
  devtool: 'inline-source-map',
  devServer: {
    hot: true,
    port: 3000
  },
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