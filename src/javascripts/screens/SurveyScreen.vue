<template>
  <div class='survey screen'>
    <div v-if='this.$route.params.question_id'>
      <survey-question-list
        v-bind:survey_title="survey.title"
        v-bind:survey_id="survey.id"
      />
    </div>
    <div v-else>
      <survey-landing-page />
    </div>

  </div>
</template>

<script>
  import http from '../http'
  import SurveyQuestionList from '../components/surveys/SurveyQuestionList.vue'
  import SurveyLandingPage from '../components/surveys/SurveyLandingPage.vue'

  export default {
    data () {
      return {
        survey: {},
      }
    },
    async mounted () {
      // TODO survey_id を動的に初期化するなどする
      const surveyId = 1;
      const response = await http.get(`/api/surveys/${surveyId}/`);
      this.survey = response.data;
    },
    methods: {
    },
    components: {
      SurveyQuestionList,
      SurveyLandingPage,
    }
}
</script>

<style scoped>
@import '../../style/screens/survey.scss'
</style>
