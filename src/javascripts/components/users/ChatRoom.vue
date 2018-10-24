<template>
  <div id="chat-body">
    <div class="list-box">
      <div
          class="message-box"
          v-for="message in messages"
          :mine="message.id == 2"
          :others="message.id != 2"
      >
        <div class="time" v-if="message.id == 2">
          <div class="read">既読</div>
          <div class="send">{{ message.created_at }}</div>
        </div>
        <div class="prof-image" v-if="message.id != 2"></div>
        <div class="message">{{ message.body }}</div>
        <div class="time" v-if="message.id != 2">
          <div class="send">{{ message.created_at }}</div>
        </div>
      </div>
      <div>
        <input v-model="msgBox" placeholder="message here"></input>
        <button v-if="roomChannel" @click="speak">送信</button>
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
    roomChannel: null,
  };
},
async mounted () {
},
async created() {
  const response = await http.get('/api/users/chats/1')
  console.log(response.data)
  this.messages = response.data

  this.roomChannel = await this.$cable.subscriptions.create( {channel: "RoomChannel", room_id: 1}, {
    received: async (data) => {
      await this.messages.push(data['message'])
      document.querySelector("#btm").scrollIntoView(true)
    },
  })
  document.querySelector("#btm").scrollIntoView(true)
},
methods: {
  speak() {
    this.roomChannel.perform('speak', {message: this.msgBox});
  },
},
}
</script>

<style scoped>
@import '../../../style/users/chat_room.scss'
</style>
