import esbuild from "esbuild";
import babel from "esbuild-plugin-babel";

async function build() {
  await esbuild.build({
    entryPoints: ["app/javascript/application.js"],
    bundle: true,
    outdir: "app/assets/builds",
    loader: { ".js": "jsx" },
    sourcemap: true,
    minify: true,
    target: ["es6"], // ここは必要に応じて変更
    format: "esm", // ESモジュール形式に設定
    plugins: [
      babel({
        filter: /\.(js|jsx|ts|tsx)$/,
        babelOptions: {
          presets: [
            [
              "@babel/preset-env",
              {
                targets: {
                  browsers: "> 0.25%, not dead",
                },
                useBuiltIns: "entry",
                corejs: 3,
              },
            ],
            "@babel/preset-react",
          ],
          plugins: [
            "@babel/plugin-proposal-class-properties",
            "@babel/plugin-proposal-object-rest-spread",
          ],
        },
      }),
    ],
  });
}

build().catch(() => process.exit(1));
