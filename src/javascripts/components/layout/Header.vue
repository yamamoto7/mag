<template>
  <header
      v-if="current_page.header"
  >
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
      Mag{{ current_page.header }}
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
          prev: false,
          header: true
        },
        {
          id: 2,
          path: '/likes',
          name: 'ReceivedLikesList',
          label: 'イイネ一覧',
          prev: false,
          header: true
        },
        {
          id: 3,
          path: '/matchings',
          name: 'MatchingInfo',
          label: 'メッセージリスト',
          prev: false,
          header: true
        },
        {
          id: 4,
          path: '/mypage',
          name: 'UserShowProfile',
          label: 'マイページ',
          prev: false,
          header: true
        },
        {
          id: 5,
          path: '/matchings',
          name: 'UserShowDetail',
          label: 'メッセージリスト',
          prev: '/',
          header: true
        },
        {
          id: 6,
          path: '/matchings',
          name: 'UserChatRoom',
          label: 'メッセージリスト',
          prev: false,
          header: false
        },
        {
          id: 7,
          path: '/matchings',
          name: 'MatchingInfo',
          label: 'メッセージリスト',
          prev: false,
          header: false
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
