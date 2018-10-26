<template>
  <div class=''>
    <!-- <user-list/> -->
    <div class='home-container'>
      <p class='home--title'>今日の運命の相手かも</p>
      <div class='flex-wrapper'>
        <!-- FIXME -->
        <fate-card
          v-for="user_item in fateUsers"
          v-bind:key="user_item.id"
          :user="user_item"
        />
      </div>
      <div class='home-sub-container'>
        <p class='sub-title'>
          あなたと一緒の趣味
        </p>
        <div class="flex-wrapper">
          <fate-slim-card
            v-for="user_item in listUsersOne"
            v-bind:key="user_item.id"
            :user="user_item"
          />
        </div>
      </div>

      <div class='home-sub-container'>
        <p class="sub-title">
          あなたと同じ職業
        </p>
        <div class="flex-wrapper">
          <fate-slim-card
            v-for="user_item in listUsersTwo"
            v-bind:key="user_item.id"
            :user="user_item"
          />
        </div>
      </div>
    </div>

  </div>
</template>

<script>
import UserList from '../components/UserList.vue'
import FateCard from '../components/FateCard.vue'
import FateSlimCard from '../components/FateSlimCard.vue'
import http from '../http'

export default {
  components: {
    UserList,
    FateCard,
    FateSlimCard,
  },
  data() {
    return {
      fateUsers: [],
      listUsersOne: [],
      listUsersTwo: [],
    }
  },
  async mounted() {
    const response1 = await http.get('/api/users/rand')
    this.fateUsers = response1.data
    const response2 = await http.get('/api/users/rand')
    this.listUsersOne = response2.data
    const response3 = await http.get('/api/users/rand')
    this.listUsersTwo = response3.data

  }
}
</script>

<style scoped>
</style>
