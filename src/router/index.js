import Vue from 'vue'
import Router from 'vue-router'
import Candidates from '@/components/Candidates'
import Vote from '@/components/Vote'
import Admin from '@/components/Admin'
import FlagIcon from 'vue-flag-icon'
Vue.use(FlagIcon)
Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'candidates',
      component: Candidates
    },
    {
      path: '/vote',
      name: 'vote',
      component: Vote
    },
    {
      path: '/admin',
      name: 'admin',
      component: Admin
    },
    {
      path: '*',
      redirect: '/'
    }
  ]
})
