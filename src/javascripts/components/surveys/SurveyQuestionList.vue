<template>
  <div class='container'>
    <h3 class='title'>
      {{ survey.title }}
    </h3>
    <div
      v-if='this.$route.params.question_id'
      class='card-wrapper'
    >
      <survey-question-card />
    </div>
    <footer/>
  </div>
</template>

<script>
  import http from '../../http'
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
      const s_response = await http.get(`/api/surveys/${surveyId}`);
      this.survey = s_response.data;

    },
    methods: {
      ClickBeforeLink(){
        this.$router.push({
          name: 'SurveyQuestionScreen',
          params: { question_id: this.question_id -= 1 }
        });

        this.fetchQuestionView();
      },
    },
    components: {
      SurveyQuestionCard
    }
  }
</script>

<style scoped>
@import '../../../style/surveys/survey_question_list.scss'
</style>
