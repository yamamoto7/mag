<template>
  <div>
    <h2>ユーザーログアウト</h2>
    <button type="submit" @click="destroyUserSession">ログアウト</button>
  </div>
</template>

<script>
import http from '../../http'

export default {
  data () {
    return {
    }
  },
  mounted () {
  },
  methods: {
    // ---------------------- ログアウト ----------------------
    async destroyUserSession () {
      try {
        await http.delete('/api/users/sign_out')
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
