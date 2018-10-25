<template>
  <header>
    <div v-if='showBackBtn'>
      <span
        @click='ClickBackBtn'
        class="back-arrow"
      />
    </div>
    <div
      @click='ClickLogo'
      class='logo'
    >
      Mag
    </div>
    <div v-if='showNotificationBtn'>
      <i
        class='fa fa-bell fa-lg notification'
        @click='CheckNotification'
      />
    </div>
  </header>
</template>

<script>
export default {
  data () {
    return {
    }
  },
  props: ['showbackbtn', 'shownotificationbtn'],
  mounted () {
    console.log(`showBackbtn: ${this.showBackBtn}`);
    console.log(`showNotification: ${this.showNotificationBtn}`)
  },
  methods: {
    ClickBackBtn: function(){
      this.$router.back();
    },
    CheckNotification: function(){
      // TODO つくる
    },
    ClickLogo: function(){
      this.$router.push('/');
    }
  },
  components: {
  }
}
</script>

<style scoped>
@import '../../../style/layout/header.scss'
</style>
