import esbuild from "esbuild";
import babel from "esbuild-plugin-babel";
import process from "process";

const isWatchMode = process.argv.includes("--watch");

const babelConfig = {
  filter: /\.(js|jsx|ts|tsx)$/,
  config: {
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
      "@babel/plugin-proposal-nullish-coalescing-operator",
      "@babel/plugin-proposal-optional-chaining",
      "babel-plugin-require-context-hook",
      "@babel/plugin-transform-private-methods",
    ],
  },
};

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
