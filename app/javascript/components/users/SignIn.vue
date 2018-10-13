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
        // リダイレクト先指定。
        await this.$router.go()
        this.$router.push('/')
      } catch (error) {
        // サーバーもしくはネットワークのエラーが返ってきた場合の処理。
        console.log(error)
      }
    }
  }
}
</script>

<style scoped>
<style>
