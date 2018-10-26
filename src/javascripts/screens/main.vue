<template>
  <div class=''>
    <!-- <user-list/> -->
    <div class='home-container'>
      <p class='home--title'>今日の運命の相手かも</p>
      <div class='flex-wrapper'>
        <!-- FIXME -->
        <fate-card />
        <fate-card />
        <fate-card />
        <fate-card />
      </div>
      <div class='home-sub-container'>
        <p class='sub-title'>
          あなたと一緒の趣味
        </p>
        <div class="flex-wrapper">
          <fate-slim-card />
          <fate-slim-card />
          <fate-slim-card />
        </div>
      </div>

      <div class='home-sub-container'>
        <p class="sub-title">
          あなたと同じ職業
        </p>
        <div class="flex-wrapper">
          <fate-slim-card />
          <fate-slim-card />
          <fate-slim-card />
        </div>
      </div>
    </div>

  </div>
</template>

<script>
import UserList from '../components/UserList.vue'
import FateCard from '../components/FateCard.vue'
import FateSlimCard from '../components/FateSlimCard.vue'

export default {
  components: {
    UserList,
    FateCard,
    FateSlimCard,
  },
  async mounted() {

  }
}
</script>

<style scoped>
</style>
