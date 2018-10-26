<template>
  <div>
    <img :src="this.user.image" alt="" class='main-img'>
    <div class='profile-container'>
      <div class='top-content'>
        <p class='name'>{{ this.user.last_name }}<span class='age'></span></p>
        <p class=''><span class='heart'/>相性度: <span class='parameter'>70%</span></p>
      </div>
      <div class='bottom-content'>
        <div class=''>
          <img
            v-for="img in this.user.images"
            :src="img.url" alt="" class='sub-img'>
        </div>
      </div>
    </div>

    <p class='profile-label'>プロフィール</p>
    <div class='profile-content'>
      {{this.user.profile}}
    </div>

    <p class='profile-label'>詳細</p>
    <ul class='profile-list-container'>
      <li class='profile-data'>
        <div class='data-type'>血液型</div>
        <div class='data-value'>{{ this.user.blood_type }}</div>
      </li>
      <li class='profile-data'>
        <div class='data-type'>体重</div>
        <div class='data-value'>{{ this.user.weight_type }}</div>
      </li>
      <li class='profile-data'>
        <div class='data-type'>身長</div>
        <div class='data-value'>{{ this.user.tall }}cm</div>
      </li>
      <li class='profile-data'>
        <div class='data-type'>現在地</div>
        <div class='data-value'>{{ this.user.state }}</div>
      </li>
      <li class='profile-data'>
        <div class='data-type'>出身地</div>
        <div class='data-value'>{{ this.user.birth_state }}</div>
      </li>
      <li class='profile-data'>
        <div class='data-type'>兄弟姉妹</div>
        <div class='data-value'>{{ this.user.brother }}</div>
      </li>
      <li class='profile-data'>
        <div class='data-type'>結婚歴</div>
        <div class='data-value'>{{ this.user.martial_status }}</div>
      </li>
      <li class='profile-data'>
        <div class='data-type'>子供の有無</div>
        <div class='data-value'>{{ this.user.children }}</div>
      </li>
    </ul>
    <p class='profile-label'>職業、学歴</p>
    <ul class='profile-list-container'>
      <li class='profile-data'>
        <div class='data-type'>学歴</div>
        <div class='data-value'>{{ this.user.academic }}</div>
      </li>
      <li class='profile-data'>
        <div class='data-type'>最終学歴の状態</div>
        <div class='data-value'>{{ this.user.academic_status }}</div>
      </li>
      <li class='profile-data'>
        <div class='data-type'>職業</div>
        <div class='data-value'>{{ this.user.job }}</div>
      </li>
      <li class='profile-data'>
        <div class='data-type'>職業詳細</div>
        <div class='data-value'>{{ this.user.job_detail }}</div>
      </li>
      <li class='profile-data'>
        <div class='data-type'>年収</div>
        <div class='data-value'>{{ this.user.salary }}</div>
      </li>
    </ul>
    <p class='profile-label'>その他</p>
    <ul class='profile-list-container'>
      <li class='profile-data'>
        <div class='data-type'>休日</div>
        <div class='data-value'>{{ this.user.holiday }}</div>
      </li>
      <li class='profile-data'>
        <div class='data-type'>重視するポイント</div>
        <div class='data-value'>{{ this.user.check_point }}</div>
      </li>
      <li class='profile-data'>
        <div class='data-type'>会うまでの希望</div>
        <div class='data-value'>{{ this.user.when_meet }}</div>
      </li>
      <li class='profile-data'>
        <div class='data-type'>タバコ</div>
        <div class='data-value'>{{ this.user.cigarette }}</div>
      </li>
      <li class='profile-data'>
        <div class='data-type'>お酒</div>
        <div class='data-value'>{{ this.user.alcohol }}</div>
      </li>
    </ul>
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
