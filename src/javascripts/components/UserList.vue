<template>
  <div>
    <h2>ユーザーリスト</h2>
    <div
      v-for="user_item in users"
      v-bind:key="user_item.id"
    >
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
    console.log(response.data)
 },
  methods: {
  }
}
</script>

<style scoped>
</style>
