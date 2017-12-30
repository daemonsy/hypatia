const path = require('path');
const appDirectory = path.resolve(__dirname, '../priv/static/js');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const entryPath = path.resolve(__dirname, 'app');

const mainPage = new HtmlWebpackPlugin({
  title: 'Hypatia',
  template: `${entryPath}/index.html`
});

const cssRule = {
  test: /\.scss$/,
  use: [
    { loader: 'style-loader' }, // creates style nodes from JS strings
    { loader: 'css-loader' }, // translates CSS into CommonJS
    { loader: 'sass-loader' } // compiles Sass to CSS
  ]
};

const jsxRule = {
  test: /\.js$|jsx$/,
  include: entryPath,
  use: {
    loader: 'babel-loader',
    options: {
      plugins: [require('babel-plugin-transform-react-jsx')]
    }
  }
}

module.exports = {
  entry: {
    app: `${entryPath}/app.js`,
  },
  resolve: {
    extensions: ['.js', '.jsx'],
    modules: [entryPath, "node_modules"]
  },
  devServer: {
    contentBase: appDirectory,
    compress: true,
    port: 9000
  },
  output: {
    path: appDirectory,
    filename: '[name].js'
  },
  module: {
    rules: [
      jsxRule,
      cssRule
    ]
  },
  plugins: [
    mainPage
  ]
};
