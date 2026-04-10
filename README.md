# rxjgrc.roppongi.express

日本縦断ギネス世界記録チャレンジ (JGRC) のウェブサイトです。

## サイト構成

| ディレクトリ | 内容 | テーマ | パス |
|---|---|---|---|
| `jgrc2023/` | JGRC2 (2023年の挑戦) | beautifulhugo | `/` |
| `jgrc2020/` | JGRC (2020年の挑戦) | ananke | `/2020/` |

## 前提条件

- Docker
- GitHub リポジトリへのアクセス権（rxjgrc2023, rxjgrc2020）

## 使い方

```bash
# 初回セットアップ（ソースリポジトリの clone / pull）
make init

# ビルド（init含む）
make build

# クリーンアップ（ソースリポジトリ削除 + Dockerイメージ削除）
make clean
```

ビルド結果は `docs/` に出力され、commit & push すると GitHub Pages で配信されます。

## URL

https://rxjgrc.roppongi.express

## ソースリポジトリ

- https://github.com/roppongiexpress/rxjgrc2023
- https://github.com/roppongiexpress/rxjgrc2020
