<template>
  <header>
    <div
      v-if="current_page.prev"
    >
      <span
        @click='ClickBackBtn(current_page.prev)'
        class="back-arrow"
      ></span>
    </div>
    <div
      @click='ClickLogo'
      class='logo'
    >
      Mag
    </div>
      <i
        class='fa fa-bell fa-lg notification'
        @click='CheckNotification'
      />
  </header>
</template>

<script>
export default {
  data () {
    return {
      current_page: '',
      pages: [
        {
          id: 1,
          path: '/',
          name: 'MainScreen',
          label: 'TOP',
          prev: false
        },
        {
          id: 2,
          path: '/likes',
          name: 'ReceivedLikesList',
          label: 'イイネ一覧',
          prev: false
        },
        {
          id: 3,
          path: '/matchings',
          name: 'MatchingInfo',
          label: 'メッセージリスト',
          prev: false
        },
        {
          id: 4,
          path: '/mypage',
          name: 'UserShowProfile',
          label: 'マイページ',
          prev: false
        },
        {
          id: 5,
          path: '/matchings',
          name: 'UserShowDetail',
          label: 'メッセージリスト',
          prev: '/'
        }
      ]
    }
  },
  mounted () {
    for(var i = 0; i < this.pages.length; i++){
      if(this.pages[i].name === this.$route.name){
        this.current_page = this.pages[i]
      }
    }
  },
  methods: {
    ClickBackBtn: function(path){
      this.$router.push(path)
      // this.$router.back();
    },
    CheckNotification: function(){
      // TODO つくる
    },
    ClickLogo: function(){
      this.$router.push('/');
    }
  },
  watch: {
    '$route' (to, from) {
      if (to.path !== from.path) {
        for(var i = 0; i < this.pages.length; i++){
          if(this.pages[i].name === this.$route.name){
            this.current_page = this.pages[i]
          }
        }
      }
    }
  }
}
</script>

<style scoped>
@import '../../../style/layout/header.scss'
</style>
