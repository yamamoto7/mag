# ユーザー関連
### ログイン
POST users/sign_in
###### parameters
```
{
  "user": {
    "email": (str),
    "password": (str)
  }
}
```
###### response
```
成功の場合 ( status: 200 )
{
  "user": {
    "name": (str),
    "token": (str)
  }
}

```

### ログアウト users/sign_out
### 登録 users/sign_up



# オブジェクト
###### user
```
{
  "id": (int),
  "name": (str)
}

```

#
#
#