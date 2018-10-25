<template>
  <div>
    <h2>相手からの話したい！</h2>
    <div class="box-wrapper">
      <div
        class="box"
        v-for="user_item in users"
        v-bind:key="user_item.id"
      >
        <router-link class="top-image" :to="{ name: 'UserShowDetail', params: { user_id: user_item.id }}"></router-link>
        <div class="bottom">
          <div class="left">あや(24)</div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import http from '../../http'

export default {
  data () {
    return {
      users: []
    }
  },
  async mounted () {
    const response = await http.get('/api/users/likes')
    this.users = response.data
 },
  methods: {
  }
}
</script>

<style scoped>
@import '../../../style/users/received_likes_list.scss'
</style>
