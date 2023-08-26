const { defineConfig } = require('@vue/cli-service')
module.exports = defineConfig({
  transpileDependencies: true,
  publicPath: '/myapp',
  configureWebpack: {
    entry: "./src/main.js",
    devServer: {
      hot: true,
      port: 8080,
      host: '0.0.0.0',
    },
    watchOptions: {
      ignored: /node_modules/,
      poll: 1000,
    }
  }
})

