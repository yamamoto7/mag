<template>
  <div id="chat-body">
    <div class="list-box">
      <div
          class="message-box"
          v-for="message in messages"
          :mine="message.user_id == user.id"
          :others="message.user_id != user.id"
      >
        <div class="time" v-if="message.user_id == user.id">
          <div class="read" v-if="message.have_read">既読</div>
          <div class="send">{{ message.submit_time }}</div>
        </div>
        <div class="prof-image" v-if="message.user_id != user.id"></div>
        <div class="message">{{ message.body }}</div>
        <div class="time" v-if="message.user_id != user.id">
          <div class="send">{{ message.submit_time }}</div>
        </div>
      </div>
      <div class="input-area">
        <input class="input-box" v-model="msgBox" placeholder="message here"></input>
        <button class="input-btn" @click="speak">送信</button>
      </div>
    </div>
    <div id="btm"></div>
  </div>
</template>

<script>
import http from '../../http'

export default {
data() {
  return {
    msgBox: "",
    messages: [],
    roomId: this.$route.params.room_id,
    roomChannel: null,
    user: []
  };
},
async mounted () {
  try{
    const response = await http.get('/api/users/get_info')
    this.user = response.data
    await http.put('/api/users/chats/have_read_room', {room_id: this.roomId})
    const userResponse = await http.get('/api/users/chats/' + this.roomId)
    this.messages = userResponse.data
    this.roomChannel = await this.$cable.subscriptions.create( {channel: "RoomChannel", room_id: this.roomId, user_id: this.user.id}, {
      received: async (data) => {
        await this.messages.push(data['message'])
        document.querySelector("#btm").scrollIntoView(true)
        await http.put('/api/users/chats/have_read_room', {room_id: this.roomId})
      }
    })
    document.querySelector("#btm").scrollIntoView(true)
  } catch(e) {
    console.log(e)
  }
},
methods: {
  speak() {
    if(this.msgBox !== ""){
      this.roomChannel.perform('speak', {message: this.msgBox})
      this.msgBox = ""
    }
  }
}
}
</script>

<style scoped>
@import '../../../style/users/chat_room.scss'
</style>
