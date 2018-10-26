<template>
  <div class=''>
    <!-- <user-list/> -->
    <div class='home-container'>
      <p class='home--title'>今日の運命の相手かも</p>
      <div class='home-wrapper'>
        <!--  -->
        <div class='home--users'>
          <div class='d-flex flex-row card-container'>
            <img class='user-img' src="/assets/1_prof.jpg">
            <div class='user-prf'>
              <p class='mt-1 w-100'>あや 愛知</p>
              <p class='mt-1 w-100'>
                職業
                <span>事務員</span>
              </p>
              <p class='mt-1 w-100'>
                年収
                <span>~300</span>
              </p>
              <p class='profile'>いい人と 出会いたいと 考えてます。 よろしく お願いします。</p>
            </div>
          </div>
        </div>
        <!-- k -->
      </div>
    </div>

  </div>
</template>

<script>
import UserList from '../components/UserList.vue'

export default {
  components: {
    UserList,
  }
}
</script>

<style scoped>
</style>
