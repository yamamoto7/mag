# mag

**※ 開発・公開は終了しています。  
※ 依存関係の脆弱性が発生しているため `package.json`, `Gemfile` などは消去しました。  
※ clone後アプリケーションを動かすことはできません。**

- 株式会社エイチーム1Monthインターンシップ(2019/09)で作成

# what is this

- 6人のメンバーでアイデア出し ~ プロトタイプ作成, ビジネスプランを含め立案。

学生の6人のチームで構成。内訳は↓
  - ビジネスプランナー ２人 (PM的なリーダもココ)
  - デザイナー ２人
  - エンジニア ２人 (← @yamamoto7, @fumihumi)

![サービスのGif](https://gyazo.com/4e133a3e56af48b2d3276faaadb3b0d9.gif)

サービス概要 : https://drive.google.com/file/d/1b_G0nwD_xly2osvqyzJr0z36b6gaiTS6/view?usp=sharing

----

# 使用技術
- API：Rails
- フロント：Vue.js (SPA風)
- インフラ：nginx, AWS(ec-2), mysql


# API定義

|URL                  |HTTP|説明|
|:--                  |--:   |:--|
|api/users/sign_in    |POST  |ユーザーログイン|
|api/users/sign_up    |POST  |ユーザー登録|
|api/users/sign_out   |DELETE|ユーザーログアウト|
|api/users/profile    |POST  ||
|api/users/profile    |GET   ||
|api/users/:id/profile|GET   ||

# ユーザー関連
### ログイン
POST users/sign_in
###### parameters
```json
{
  "user": {
    "email": "str",
    "password": "str"
  }
}
```
###### response
```json
// 成功の場合 ( status: 200 )
{
  "user": {
    "オブジェクト": "user参照"
  }
}

```

### ログアウト
DELETE users/sign_out
###### parameters
```json
```
###### response
```json
// 成功の場合 ( status: 200 )
```


### 登録
POST users/sign_up
###### parameters
```json
{
  "user": {
    "email": "str",
    "password": "str"
  }
}
```
###### response
```json
// 成功の場合 ( status: 200 )
{
  "user": {
    "オブジェクト": "user参照"
  }
}

```



# オブジェクト
###### user
```json
{
  "id": "int",
  "name": "str"
}

```

#
#
#
