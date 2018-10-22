<template>
  <div>
    <h2 class='survey screen'>
      アンケート画面
    </h2>

    <div>
      {{ survey.id }}/{{ survey.title }} ({{survey.active && '実施中'　|| '未実施'}})
      <survey-question-list
        v-bind:survey_title="survey.title"
        v-bind:survey_id="survey.id"
      />
    </div>
  </div>
</template>

<script>
  import http from '../http'
  import SurveyQuestionList from '../components/SurveyQuestionList.vue'

  export default {
    data () {
      return {
        survey: {},
        answers: []
      }
    },
    async mounted () {
      // TODO survey_id を動的に初期化するなどする
      const surveyId = 1;
      const response = await http.get(`/api/surveys?survey_id=${surveyId}`);
      console.log(`response: ${response.data}`);
      this.survey = response.data;
    },
    methods: {
    },
    components: {
      SurveyQuestionList,
    }
  }
</script>

<style scoped>
@import '../../style/screens/survey.scss'
</style>
