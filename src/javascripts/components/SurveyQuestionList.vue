<template>
  <div>
    <h2>question</h2>

    {{survey_title}}

    <!-- <div
      v-for='(question, index) in questions'
      v-bind:key='question.id'
    >
      <survey-question-card
        :question='question'
        :key='question.id'
        :index='index + 1'
      ></survey-question-card>
    </div> -->

  </div>
</template>

<script>
  import http from '../http'
  import SurveyQuestionCard from './SurveyQuestionCard.vue'

  export default {
    data () {
      return {
        questions: []
      }
    },
    props: ['survey_title', 'survey_id'],
    async mounted () {
      // FIXME このコンポーネント render するときに親コンポーネント (survey.vue)から引数でうけとりたい
      this.hoge();

      const response = await http.get('/api/surveys/1/questions');
      this.questions = response.data;
    },
    methods: {
      hoge() {
        self = this
        console.log(self.survey_id);
        console.log(this.survey_title);
        console.log('hoge');
        // console.log(this.survey)
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
