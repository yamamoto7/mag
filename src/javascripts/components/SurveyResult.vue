<template>
  <div class='survey_result'>
    <div class='container img' :style="'background-image: url(' + user.image + ')'" />
    <div class='cover-container'>
      <div class='user-img img' :style="'background-image: url(' + user.image + ')'" />
      <span class='sub-title'>あなたの</span>
      <p class='title'>診断結果</p>
      <div class='mt-1'>
        <p class="message">思い立ったらすぐ行動しちゃう</p>
        <p class='diagnosis_type'>いつも冷静な論理派タイプ</p>
      </div>
    </div>

    <div class='card'>
      <p class='result_type_label'>あなたの価値観</p>
      <p class='result_type'>
        いつも冷静で、論理的に考えないと気が済まないのが特徴の、いわゆる「仕事のできるオンナ」。有名人に例えるなら・・・仲間由紀恵、菊川玲、アガサ・クリスティ
      </p>
    </div>

    <div class='big-card'>
      <p class='result_type_label'>あなたにぴったりのタイプ</p>
      <div class='type_checker'>
        <div class='circle orange' />
          <p class='orange-circle-title'>あなた</p>
          <p class='orange-circle-detail'>論理派タイプ</p>
        <p class='cross img' />
        <div class='circle blue' />
          <p class='blue-circle-title'>あいて</p>
          <p class='blue-circle-detail'>論理派タイプ</p>
      </div>
      <p class='result_type'>
        いつも冷静で、論理的に考えないと気が済まないのが特徴の、いわゆる「仕事のできるオンナ」。有名人に例えるなら・・・仲間由紀恵、菊川玲、アガサ・クリスティ
      </p>
    </div>

    <p class='search' @click='searchClick'>相手を探しにいく</p>
  </div>
</template>

<script>
  import http from '../http'

  export default {
    data () {
      return {
        user: {},
        currentUserImg: '/assets/sample1.jpeg'
      }
    },
  async mounted () {
      const response = await http.get('/api/users/get_info')
      this.user = response.data;
      this.currentUserImg = this.user.image;
    },
    methods: {
      searchClick() {
        window.location.pathname = '/';
      }
    },
    components: {
    }
}
</script>

<style scoped>
@import '../../style/survey_result.scss'
</style>
