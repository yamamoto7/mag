<template>
  <div>
    <h2>とりあえず機能単位のコンポーネントをここに。</h2>
    <get-info></get-info>
    <sign-up></sign-up>
    <sign-in></sign-in>
    <sign-out></sign-out>
  </div>
</template>

<script>
import SignUp from './users/SignUp.vue'
import SignIn from './users/SignIn.vue'
import SignOut from './users/SignOut.vue'
import GetInfo from './users/GetInfo.vue'
export default {
  components: {
    SignUp,
    SignIn,
    SignOut,
    GetInfo
  }
}
</script>

<style scoped>
</style>
