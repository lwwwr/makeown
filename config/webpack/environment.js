const { environment } = require("@rails/webpacker");

// module.exports = environment

const merge = require("webpack-merge");
const webpack = require("webpack");
environment.loaders.append("less", {
  test: /\.less$/,
  use: [
    {
      loader: "style-loader" // creates style nodes from JS strings
    },
    {
      loader: "css-loader" // translates CSS into CommonJS
    },
    {
      loader: "less-loader"
    } // compiles Less to CSS,
  ]
});

environment.plugins.prepend(
  "Provide",
  new webpack.ProvidePlugin({
    $: "jquery",
    JQuery: "jquery",
    jquery: "jquery",
    "window.Tether": "tether",
    Popper: ["popper.js", "default"] // for Bootstrap 4
  })
);

const envConfig = environment;
const aliasConfig = (module.exports = {
  resolve: {
    alias: {
      jquery: "jquery/src/jquery"
    }
  }
});

module.exports = merge(envConfig.toWebpackConfig(), aliasConfig);
