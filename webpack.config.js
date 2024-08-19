const path = require("path");

module.exports = {
  mode: "development",
  entry: "./app/javascript/packs/application.js",
  output: {
    path: path.resolve(__dirname, "app/assets/builds"),
    filename: "bundle.js",
    publicPath: "/assets/",
  },
  module: {
    rules: [
      {
        test: /\.m?js$/,
        exclude: /node_modules\/(?!(date-fns))/,
        use: {
          loader: "babel-loader",
          options: {
            presets: ["@babel/preset-env"],
            plugins: [
              "@babel/plugin-proposal-optional-chaining",
              "@babel/plugin-proposal-nullish-coalescing-operator",
            ],
          },
        },
      },
    ],
  },
};
