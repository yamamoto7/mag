<template>
  <div>
    <img src="/assets/saitoasuka.jpg" alt="" class='main-img'>
    <div class='profile-container'>
      <div class='top-content'>
        <p class='name'>あや<span class='age'>(24)</span></p>
        <p class=''><span class='heart'/>相性度: <span class='parameter'>70%</span></p>
      </div>
      <div class='bottom-content'>
        <div class=''>
          <img src="/assets/sample1.jpeg" alt="" class='sub-img'>
          <img src="/assets/sample2.jpeg" alt="" class='sub-img'>
        </div>
      </div>
    </div>

    <p class='profile-label'>プロフィール</p>
    <div class='profile-content'>
      {{user.profile}}
    </div>

    <p class='profile-label'>詳細</p>
    <ul class='profile-list-container'>
      <li class='profile-data'>
        <span class='data-type'>血液型</span>
        <span class='data-value'></span>
      </li>
      <li class='profile-data'>
        <span class='data-type'>身長</span>
        <span class='data-value'></span>
      </li>
      <li class='profile-data'>
        <span class='data-type'>学歴</span>
        <span class='data-value'></span>
      </li>
      <li class='profile-data'>
        <span class='data-type'>体重</span>
        <span class='data-value'></span>
      </li>
    </ul>

    <footer>
      <p class='btn sorry'>ごめんね</p>
      <p v-if="have_already_liked">イイネ済みです</p>
      <p v-else @click='submitLike' class='btn like'>話したい！</p>
    </footer>
  </div>
</template>

<script>
import http from '../../http'

export default {
  data () {
    return {
      user_id: this.$route.params.user_id,
      have_already_liked: false,
      user: ''
    }
  },
  async mounted () {
    const response = await http.get('/api/users/' + this.user_id)
    console.log(response.data)
    this.user = response.data.user
    this.have_already_liked = response.data.have_already_liked
  },
  methods: {
    async submitLike () {
      try {
        const response = await http.post('/api/users/likes', {user_id: this.user_id})
        this.have_already_liked = response.data
      } catch (error) {
        console.log(error)
      }
    }
  }
}
</script>

<style scoped>
@import '../../../style/users/show_detail.scss'
</style>
