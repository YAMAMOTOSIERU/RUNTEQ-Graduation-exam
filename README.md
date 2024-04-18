## README

## サービス概要

```
・筋トレ続ける為のサービスです。
    ・筋トレは継続が難しいのでこのサービスを使用すると同じ目標の筋トレをしたい人たちが集まりお互いの日記やチャットで日々の頑張りを投稿しモチベーションにつながります。
    ・体重などを毎日書き込むことで毎日どれだけ下がったか、逆にどれだけ増えてしまったか日記形式と線グラフで目に見えます。
```

## このサービスへの思い・作りたい理由

```
・社会人になると運動する機会が減り、体重や脂肪が増えて筋トレをしても持続が難しく諦めていましたが、健康面やしっかりとした体を作りたいと思っていたので、日記や周りの人たちと一緒に頑張ることで筋トレを続けることができるのではないのかという気持ちで作成しようと思いました。
```

## ユーザー層について

```
・20~40代の筋トレをしてみようかなという考えている人。
```

## サービスの利用イメージ

```
・掲示板機能を使用してその日なんの筋トレをしかのか。
・チャット機能を使用して今現在頑張っている人を見て自分のモチベーションを上げる。
・線グラフで自分の体重を確認する。
```

## ユーザー獲得について

```
・筋トレをしている知り合いなどで口コミで獲得していく。
・SEO対策
```

## サービスの差別化ポイント・推しポイント

```
　Xやインスタグラムなどに似ていますがいい意味で筋トレ専門でのサービスなので
・プライバシーを守り、Xやインスタなど知り合いに体重を公開しなくて良い。
・線グラフで自分の体重の変化が見ることができる。
・自分の投稿をしていると日記ような扱いで見返すことができる。
・同じ目標を目指している人同士が繋がり、モチベーションも上げやすい。
```

## 機能候補

```
・会員登録
・ログイン
・掲示板一覧
・掲示板詳細
・検索・一覧表示
・いいね
・コメント
・タグ機能

MVPリリース後
・チャット機能
・線グラフ
```

## 機能の実装方法予定

```
・チャット機能は WebSocket を使用する予定です。
・線グラフ機能は Chartkick を使用する予定です。
```

## 使用する予定の技術スタック

```
・Ruby
・Rails
・RSpec
・js
・Bootstrap

```

### 画面遷移図

https://www.figma.com/file/U99iU1mOWdFnhDKxtWwDMk/Untitled?type=design&node-id=0%3A1&mode=design&t=hSfkGzVMdUEIU8z5-1

### README に記載した機能

- [×] ユーザー登録
- [×] ログイン機能
- [×] 掲示板一覧
- [×] 掲示板詳細(未ログインでも閲覧可能)
- [×] 検索・一覧
- [×] 投稿編集機能
- [×] 投稿削除機能
- [×] コメント投稿機能
- [×] コメント閲覧機能(未ログインでも閲覧可能)
- [×] コメント編集機能
- [×] コメント削除機能
- [×] タグ投稿機能
- [×] タグ編集機能
- [×] タグ削除機能
- [×] いいね機能
- [×] いいね解除機能
- [×] チャット機能
- [×] チャット編集機能
- [×] チャット削除機能
- [×] 線グラフ機能

### 未ログインでも閲覧または使用できるページ

- [×] 記事投稿機能（画像投稿含む）
- [×] コメント閲覧機能（未ログインでも閲覧可能）
