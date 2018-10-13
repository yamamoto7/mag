|URL                  |HTTP|説明|
|:--                  |--:   |:--|
|api/users/sign_in    |POST  |ユーザーログイン|
|api/users/sign_up    |POST  |ユーザー登録|
|api/users/sign_out   |DELETE|ユーザーログアウト|
|api/users/profile    |POST  ||
|api/users/profile    |GET   ||
|api/users/:id/profile|GET   ||
||||
||||
||||
||||

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