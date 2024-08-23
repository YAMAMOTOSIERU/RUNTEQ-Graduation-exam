import esbuild from "esbuild";
import babel from "esbuild-plugin-babel";
import process from "process";

// コマンドライン引数に --watch が含まれているかチェック
const isWatchMode = process.argv.includes("--watch");

// Babelの設定
const babelConfig = {
  filter: /\.(js|jsx|ts|tsx)$/,
  babelOptions: {
    presets: [
      [
        "@babel/preset-env",
        {
          targets: { browsers: "> 0.25%, not dead" },
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
};

// esbuildの設定
const buildOptions = {
  entryPoints: ["app/javascript/application.js"],
  bundle: true,
  outdir: "app/assets/builds",
  loader: { ".js": "jsx" },
  external: ["channels", "controllers"],
  sourcemap: true,
  minify: true,
  target: ["es6"],
  format: "esm",
  plugins: [babel(babelConfig)],
};

async function build() {
  try {
    // esbuildのコンテキストを作成
    const context = await esbuild.context(buildOptions);

    if (isWatchMode) {
      // ウォッチモードの場合
      await context.watch();
      console.log("Watching for changes...");
    } else {
      // 単発ビルドの場合
      await context.rebuild();
      await context.dispose();
      console.log("Build completed successfully.");
    }
  } catch (error) {
    console.error("Build failed:", error);
    process.exit(1);
  }
}

// ビルド実行
build();
