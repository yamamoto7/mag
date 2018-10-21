<template>
  <div>
    <h2>ユーザーリスト</h2>
    <div
      v-for="user_item in users"
      v-bind:key="user_item.id"
    >
    <router-link :to="{ name: 'UserShowDetail', params: { user_id: user_item.id }}">詳細</router-link>
    {{ user_item.id }}/{{ user_item.email }}
    </div>
  </div>
</template>

<script>
import http from '../http'

export default {
  data () {
    return {
      users: []
    }
  },
  async mounted () {
    const response = await http.get('/api/users')
    this.users = response.data
 },
  methods: {
  }
}
</script>

<style scoped>
@import '../../style/user_list.scss'
</style>
