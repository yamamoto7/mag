<template>
  <div>
    <div class="box-wrapper">
      <div
        class="box"
        v-for="user_item in users"
        v-bind:key="user_item.id"
      >
        <router-link class="top-image" :to="{ name: 'UserShowDetail', params: { user_id: user_item.id }}"></router-link>
        <div class="bottom">
          <div class="left">{{ user_item.first_name }}</div>
          <div class="right"></div>
        </div>
      </div>
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
