<template>
  <div>
    <div
      v-for="room_item in rooms"
      v-bind:key="room_item.id"
    >
      <router-link class="room-item" :to="{ name: 'UserChatRoom', params: { room_id: room_item.id }}">
        <div class="image"
          :style="'background-image:url(' + room_item.user.email + ')'"
        ></div>
        <div class="text">
          <div class="user-name">{{ room_item.user.first_name }} {{ room_item.user.last_name }}</div>
          <div class="user-message"></div>
        </div>
        <div class="info">
          <div class="time">12:12</div>
          <div class="badge" :data="room_item.count"></div>
        </div>
      </router-link>
    </div>
  </div>
</template>

<script>
import http from '../../http'

export default {
  data () {
    return {
      rooms: [],
    }
  },
  async mounted () {
    try{
      const response = await http.get('/api/users/chats')
      this.rooms = await response.data.rooms
      for (var i = 0; i < this.rooms.length; i++) {
        const userId = await http.get('/api/users/chats/get_room_user_id/' + this.rooms[i].id)
        const userImage = await http.get('/api/users/images/get_top_image/' + userId.data.id)
        if (userImage.data)
          this.rooms[i].user.email = userImage.data.profile_image.blob.service_url
        else
          this.rooms[i].user.email = 'https://www.derev.com/uploads/crop/400/400/user/avatar/19193ef05fb2112f45763b62792106022bbab573.jpg'
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
@import '../../../style/users/chat_room_list.scss'
</style>
