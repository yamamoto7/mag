<template>
  <div class='screen main'>
    <main-header show-back-btn="true" show-notification-btn="true"/>
    <main-footer />
  </div>
</template>

<script>
import MainHeader from '../components/layout/Header.vue'
import MainFooter from '../components/layout/Footer.vue'

export default {
  components: {
    MainHeader,
    MainFooter,
  }
}
</script>

<style scoped>
</style>
