const path = require('path');
const BundleTracker = require('webpack4-bundle-tracker');
const entry = (name) => path.resolve('src', `${name}.js`);

module.exports = {
  // requires to run the `serve` or `build` command with correct STATIC_URL env var
  publicPath: process.env.STATIC_URL,
  chainWebpack: (config) => {
    config.optimization
      .splitChunks(false);

    config
      .plugin('BundleTracker')
      .use(BundleTracker, [{filename: 'manifest.json'}]);

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
  },
  pages: {
    main: entry('main'),
  },
};
