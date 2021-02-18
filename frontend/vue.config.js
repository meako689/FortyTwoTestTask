const path = require('path');
const { CleanWebpackPlugin } = require('clean-webpack-plugin');
const { WebpackManifestPlugin } = require('webpack-manifest-plugin');
const entry = (name) => path.resolve('src', `${name}.js`);

module.exports = {
  publicPath: '/static/',
  chainWebpack: config => {
    config.optimization
      .splitChunks(false);

    config.resolve.alias
      .set('__STATIC__', 'static');

    config.devServer
      .public('http://0.0.0.0:3000')
      .host('0.0.0.0')
      .port(3000)
      .hotOnly(true)
      .watchOptions({poll: 1000})
      .https(false)
      .headers({
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, PATCH, OPTIONS',
        'Access-Control-Allow-Headers': 'X-Requested-With, content-type, Authorization',
      })
      .contentBase('8000');
  },
  configureWebpack: {
    resolve: {
      // so you can use absolute imports in scss too
      alias: {
        '/frontend': path.resolve(__dirname)
      }
    },
    plugins: [
      new CleanWebpackPlugin(),
      new WebpackManifestPlugin({basePath: 'static/'}),
    ]
  },
  pages: {
    main: entry('main'),
  },
};
