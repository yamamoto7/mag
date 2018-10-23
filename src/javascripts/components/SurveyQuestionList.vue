<template>
  <div>
    <h3>
      {{ survey.id }}/{{ survey.title }} ({{survey.active && '実施中' || '未実施'}})
    </h3>
    <div v-if='this.$route.params.question_id'>
      <survey-question-card />
    </div>
    <div v-else>
      <button @click='startSurvey'>診断する</button>
    </div>
  </div>
</template>

<script>
  import http from '../http'
  import SurveyQuestionCard from './SurveyQuestionCard.vue'

  export default {
    data () {
      return {
        questions: [],
        survey: {},
      }
    },
    props: ['survey_title', 'survey_id'],
    async mounted () {
      // FIXME このコンポーネント render するときに親コンポーネント (survey.vue)から引数でうけとりたい
      const q_response = await http.get('/api/surveys/1/questions');
      this.questions = q_response.data;
      const surveyId = 1;
      const s_response = await http.get(`/api/surveys?survey_id=${surveyId}`);
      this.survey = s_response.data;

    },
    methods: {
      startSurvey: function(){
        this.$router.push({
          name: 'SurveyQuestionScreen',
          params: { question_id: this.question_id = 1 }
        });
      }
    },
    components: {
      SurveyQuestionCard
    }
  }
</script>

<style scoped>
@import '../../style/survey_question_list.scss'
</style>
