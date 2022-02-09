import { createRouter, createWebHistory } from 'vue-router'

const routes = [
  {
    path: '/',
    name: 'LandingPage',
    component: () => import('../views/LandingPage.vue')
  },
  {
    path: '/Home',
    name: 'Home',
    component: () => import('../views/Home.vue')
  },
  {
    path: '/ContactUs',
    name: 'ContactUs',
    component: () => import('../views/ContactUs.vue')
  },
  {
    path: '/AboutUs',
    name: 'AboutUs',
    component: () => import('../views/AboutUs.vue')
  },
  {
    path: '/Login',
    name: 'Login',
    component: () => import('../views/Login.vue')
  },
  {
    path: '/Register',
    name: 'Register',
    component: () => import('../views/Register.vue')
  },
  {
    path: '/LeagueRegistration',
    name: 'LeagueRegistration',
    component: () => import('../views/LeagueRegistration.vue')
  },
  {
    path: '/InviteFriends',
    name: 'InviteFriends',
    component: () => import('../views/InviteFriends.vue')
  },
  {
    path: '/SignAndDraft',
    name: 'SignAndDraft',
    component: () => import('../views/SignAndDraft.vue')
  },
  {
    path: '/WaitList',
    name: 'WaitList',
    component: () => import('../views/WaitList.vue')
  }
]

const router = createRouter({
  history: createWebHistory(process.env.BASE_URL),
  routes
})

export default router
