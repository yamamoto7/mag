<template>
  <div>
    <h2>今までの運命の相手かも</h2>
    <div class="box-wrapper">
      <div
        class="box"
        v-for="user_item in users"
        v-bind:key="user_item.id"
      >
        <router-link
          class="top-image"
          :to="{ name: 'UserShowDetail', params: { user_id: user_item.id }}"
          :style="'background-image:url(' + user_item.image + ')'"
        ></router-link>
        <div class="bottom">
          <div>{{ user_item.first_name }}</div>
          <div>{{ user_item.profile }}</div>
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
    try{
      const response = await http.get('/api/users')
      this.users = response.data
    } catch(e) {
      console.log(e)
    }
 },
  methods: {
  }
}
</script>

<style scoped>
@import '../../../style/users/received_likes_list.scss'
</style>
