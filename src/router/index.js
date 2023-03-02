import { createRouter, createWebHistory } from 'vue-router'
import etelek from '../views/etelek.vue'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: etelek
    }
  ]
})

export default router
