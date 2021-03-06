# :cherry_blossom:あなたと和菓子と
[トップ画面]
<img src="https://user-images.githubusercontent.com/79884989/123546722-be248f80-d798-11eb-8f31-dd685df93076.png">

## URL
http://youandwagashi.com/

## 概要
**老舗和菓子店が気軽にweb上に自店情報を掲載することができ、ユーザーの商品レビューを通して良い点、改善点を知ることができるサイト**です。
また、ユーザーはさまざまな店舗と商品レビューを見ることで自身が知らなかった和菓子の魅力を知ることができます。

### テーマ
和菓子が身近に感じられるサイト

### テーマを選んだ理由
両親が町の和菓子屋を営んでおり、もっと多くの人に知ってもらいたいという思いでこのサイトを作成しました。<br />
大手の和菓子屋さんのようにいろんなサイトでPRしたいけど、広告費がかかるし、もっと簡単にPRしたい！<br />
という思いを叶えるためのサイトです。<br />
また、**web上でのPRをしていないお店は参考になる商品レビューが少ない**、という問題解決の為に <br />
商品別にレビューを見ることが出来ます。<br />
和菓子よりも洋菓子！という若い方が多くなっている中、皆さんの近辺にある和菓子屋さんをSNSで知ることが出来れば、<br />
行ってみよう！と思うきっかけになり、**老舗和菓子屋の魅力をより一層広めることができる**と思っています。<br />

### ターゲットユーザー
- 広告費を安くPRの場がほしい和菓子店
- 和菓子離れしている若者ユーザー
- おすすめの和菓子屋を共有したい和菓子好きユーザー

### 主な利用シーン
- 和菓子店が自身のお店の情報を  web上にアップしたいと思った時。
- 商品ごとのレビューが見たいと思った時。
- 和菓子を食べ慣れない方が"和菓子ってどんなものがあるんだろう？"と思った時。
- 和菓子好きユーザーが和菓子を商品別に詳しく共有したいと思った時。

## 実装機能一覧
- ユーザ登録、ログイン機能(devise)
- 投稿機能
- 画像投稿
- 投稿住所位置情報
- 行った、行ってみたいボタン
- ランキング機能
- レビュー機能
- SNSシェアボタン
- ジャンル機能

### チャレンジ要素一覧
https://docs.google.com/spreadsheets/d/1gxOnxhJLKD60gjl6euRBWOTPY-ar_ORSNn8YSQmFSRs/edit?usp=sharing

### テスト
- 単体テスト（モデル）

### Gem
- devise
- refile
- refile-mini_magick
- kaminari '1.2.1'
- bootstrap'4.5'
- jquery-rails
- font-awesome-sass '5.13'
- social-share-button
- rails-i18n
- devise-i18n
- geocoder
- rubocop-airbnb

## 設計書
### ER図
<img src="https://user-images.githubusercontent.com/79884989/120259195-72ccad80-c2ce-11eb-82ca-ada6227d898f.jpg" width="500px">

### UI Flow
<a href="https://drive.google.com/file/d/10ssUe_twl4rnQy-rQ9bSkhb0-CIQtzBM/view?usp=sharing">こちらをクリック</a>

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 本番環境
- AWS (EC2、RDS for MySQL、Route53、CloudWatch)
- MySQL2
- Nginx、 Puma

## 使用素材
- PHOTO AC
