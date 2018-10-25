<template>
  <div class='container'>
    <div class='title-wrapper'>
      <span class='sub-title'>あなたにぴったりな人は？</span>
      <h2 class='title'>
        価値観診断
      </h2>
    </div>

    <div class='catchcopy'>
      <p>あなたの価値観を診断して</p>
      <p>相性の良い相手を紹介します</p>
      <p>まずはサクサクと質問に答えていきましょう</p>
    </div>
    <p @click='startSurvey' class='survey-btn'>さっそく始める</p>
  </div>
</template>

<script>
  import http from '../../http'

  export default {
    data () {
      return {
        survey: {}
      }
    },
    async mounted () {
      const surveyId = 1;
      const s_response = await http.get(`/api/surveys/${surveyId}`);
      this.survey = s_response.data;
    },
    methods: {
      startSurvey: function(){
        this.$router.push({
          name: 'SurveyQuestionScreen',
          params: { question_id: 1 }
        });
      }
    },
    components: {}
  }
</script>

<style scoped>
@import '../../../style/surveys/survey_landing_page.scss'
</style>
