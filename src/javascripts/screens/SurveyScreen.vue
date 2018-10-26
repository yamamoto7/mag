<template>
  <div class='survey screen'>
    <div v-if='this.$route.params.question_id'>
      <survey-question-list
        v-bind:survey_title="survey.title"
        v-bind:survey_id="survey.id"
      />

      <survey-footer
        v-if='Number(this.$route.params.question_id) !== 1'
      />

    </div>
    <div v-else>
      <survey-landing-page />
    </div>

  </div>
</template>

<script>
  import http from '../http'
  import SurveyLandingPage from '../components/surveys/SurveyLandingPage.vue'
  import SurveyQuestionList from '../components/surveys/SurveyQuestionList.vue'
  import SurveyFooter from '../components/surveys/SurveyFooter.vue'

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
      SurveyLandingPage,
      SurveyQuestionList,
      SurveyFooter,
    }
}
</script>

<style scoped>
@import '../../style/screens/survey.scss'
</style>
