const { environment } = require('@rails/webpacker')
const webpack = require("webpack");
environment.plugins.append(
    "Provide",
    new webpack.ProvidePlugin({
        $: "jquery",
        jQuery: "jquery",
        Popper: ["popper.js", "default"]
    })
);

// Get the actual sass-loader config
const sassLoader = environment.loaders.get('sass');
const sassLoaderConfig = sassLoader.use.find(function(element) {
    return element.loader == 'sass-loader'
});
// Use Dart-implementation of Sass (default is node-sass)
const options = sassLoaderConfig.options
options.implementation = require('sass');
module.exports = environment