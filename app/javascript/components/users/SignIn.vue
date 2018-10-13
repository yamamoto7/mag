<template>
  <div>
    <h2>ユーザーログイン</h2>
    <div>メールアドレス</div>
    <input
      @input="updateUserEmail"
      :value="user.email"
    />
    <div>パスワード</div>
    <input
      @input="updateUserPass"
      :value="user.password"
    /><br>
    <button type="submit" @click="newUserSession">ログイン</button>
  </div>
</template>

<script>
import http from '../../http'

export default {
  data () {
    return {
      // フォームなどで送信する亀の情報を保存
      user: {
        email: 'yamamoto2@gmail.com',
        password: 'pppppppp',
      }
    }
  },
  mounted () {
  },
  methods: {
    // ---------------------- フォームに入力してある値をdata()にある値に保存するための関数。
    updateUserEmail (e) {
      this.user.email = e.target.value
    },
    updateUserPass (e) {
      this.user.password = e.target.value
    },
    // ---------------------- ログイン ----------------------
    async  newUserSession () {
      try {
        const response = await http.post('/api/users/sign_in', this.user)
        // ローカルストレージに認証トークンを保存
        // バリデーションのエラーが返ってきた場合の処理。
        // Emailアドレスが既に使われているなど。
        if (response.status === 202) {
          // エラー内容をdataに入れる。
          this.errors = response.data
        } else {
        // その中にある認証トークンをローカルストレージに保存。
        // 今後はAPI通信を行う際にこの値をリクエストヘッダに含めることでサーバー上でログインしていると判断されるようになる。
          await localStorage.setItem('Authorization', response.data.token)
          // リダイレクト先指定。
          await this.$router.go()
          this.$router.push('/')
        }
      } catch (error) {
        // サーバーもしくはネットワークのエラーが返ってきた場合の処理。
        console.log(error)
      }
    },
  }
}
</script>

<style scoped>
<style>
