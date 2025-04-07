const path = require('path');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const HtmlWebpackPlugin = require('html-webpack-plugin');
const utwm = require('unplugin-tailwindcss-mangle/webpack'); // ✅ No destructuring here

module.exports = {
  mode: 'production',
  entry: './src/index.js',  // Adjust this to your entry file
  output: {
    filename: 'bundle.js',
    path: path.resolve(__dirname, 'dist'),
    clean: true,
  },
  module: {
    rules: [
      {
        test: /\.css$/,
        use: [MiniCssExtractPlugin.loader, 'css-loader', 'postcss-loader'],
      },
      {
        test: /\.html$/,
        use: ['html-loader'],
      },
    ],
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: 'resume.min.css',
    }),
    new HtmlWebpackPlugin({
      template: './resume.html',
      filename: 'index.html',
    }),
    utwm({ // ✅ Properly using the plugin
      classGenerator: (originalClass) => `_${originalClass.slice(0, 4)}`
    }),
  ],
  resolve: {
    extensions: ['.js', '.css', '.html'],
  },
};
