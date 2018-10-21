<template>
  <div>
    <h2>ログイン中のユーザーの情報</h2>
    {{ this.user }}
  </div>
</template>

<script>
import http from '../../http'

export default {
  data () {
    return {
      // フォームなどで送信する亀の情報を保存
      user: ''
    }
  },
  async mounted () {
    const response = await http.get('/api/users/get_info')
    this.user = response.data
  }
}
</script>

<style scoped>
@import '../../../style/users/get_info.scss'
</style>
