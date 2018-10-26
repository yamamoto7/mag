<template>
  <div class=''>
    <!-- <user-list/> -->
    <div class='home-container'>
      <p class='home--title'>今日の運命の相手かも</p>
      <div class='fate-wrapper'>
        <fate-card />
      </div>
    </div>

  </div>
</template>

<script>
import UserList from '../components/UserList.vue'
import FateCard from '../components/FateCard.vue'

export default {
  components: {
    UserList,
    FateCard,
  }
}
</script>

<style scoped>
</style>
