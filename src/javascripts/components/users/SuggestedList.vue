<template>
  <div>
    <h2>相手からの話したい！</h2>
    <div class="box-wrapper">
      <div
        class="box"
        v-for="user_item in users"
        v-bind:key="user_item.id"
      >
        <router-link
          class="top-image"
          :to="{ name: 'UserShowDetail', params: { user_id: user_item.id }}"
          :style="'background-image:url(' + user_item.email + ')'"
        ></router-link>
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
    try{
      const response = await http.get('/api/users')
      this.users = response.data
      for (var i = 0; i < this.users.length; i++) {
        const userImage = await http.get('/api/users/images/get_top_image/' + this.users[i].id)
        if (userImage.data)
          this.users[i].email = userImage.data.profile_image.blob.service_url
        else
          this.users[i].email = 'https://www.derev.com/uploads/crop/400/400/user/avatar/19193ef05fb2112f45763b62792106022bbab573.jpg'
      }
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
