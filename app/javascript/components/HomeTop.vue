<template>
  <div>
    <h2>ユーザーログイン、ログアウト、登録用のページ</h2>
    <sign-up></sign-up>
    <sign-in></sign-in>
    <sign-out></sign-out>
  </div>
</template>

<script>
import SignUp from './users/SignUp.vue'
import SignIn from './users/SignIn.vue'
import SignOut from './users/SignOut.vue'
export default {
  components: {
    SignUp,
    SignIn,
    SignOut
  }
}
</script>

<style scoped>
</style>