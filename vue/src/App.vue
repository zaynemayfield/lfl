<template>
  <div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">
        <!-- If logged in this becomes the home link? -->
        <router-link :to="{ name: 'LandingPage' }" class="navbar-brand">
          <svg id="Group_15" data-name="Group 15" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="82.946" height="37.295" viewBox="0 0 82.946 37.295">
  <defs>
    <clipPath id="clip-path">
      <rect id="Rectangle_16" data-name="Rectangle 16" width="82.946" height="37.295" fill="none"/>
    </clipPath>
  </defs>
  <path id="Path_13" data-name="Path 13" d="M23.8,0,0,34.148,66.593,37.3,82.946,2.871h0Z" transform="translate(0 0)" fill="#8eef50"/>
  <g id="Group_14" data-name="Group 14" transform="translate(0)">
    <g id="Group_13" data-name="Group 13" clip-path="url(#clip-path)">
      <path id="Path_14" data-name="Path 14" d="M352.392,98.245h-5.6l3.878-15.586h22.256l-1.09,4.332H355.219l-.6,2.423h8.464l-1.028,4.148h-8.484l-1.175,4.683" transform="translate(-315.4 -75.175)"/>
      <path id="Path_15" data-name="Path 15" d="M516.261,157.263h5.6c-.911,3.678-1.771,7.067-2.692,10.786h8.255l-1.133,4.555H512.423c1.3-5.219,2.546-10.146,3.838-15.341" transform="translate(-466.03 -143.025)"/>
      <path id="Path_16" data-name="Path 16" d="M238.885,104.753c1.3-5.223,4.233-16.905,5.524-22.094h5.6c-.91,3.672-3.458,13.814-4.379,17.529h16.484l-1.132,4.565Z" transform="translate(-217.257 -75.175)"/>
    </g>
  </g>
</svg>
          </router-link>
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNav"
          aria-controls="navbarNav"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <!-- Only show this if user is logged in -->
            <li v-if="isLoggedIn" class="nav-item">
              <router-link
                class="nav-link"
                active-class="active"
                :to="{ name: 'Home' }"
                >
<svg xmlns="http://www.w3.org/2000/svg" width="22.182" height="24.215" viewBox="0 0 22.182 24.215">
  <g id="Group_105" data-name="Group 105" transform="translate(0 0)">
    <path id="Path_81" data-name="Path 81" d="M158.476,6.209l-.184,2.709h-.018l-.883,13.059-.524,3.77h-8.489l-.519-3.766L147,9.3l-.041-.382-.179-2.709Z" transform="translate(-141.508 -6.209)"/>
    <path id="Path_82" data-name="Path 82" d="M181.05,16.787l-1.393,10.222-2.635-.064.69-10.158Z" transform="translate(-158.868 -12.28)"/>
    <path id="Path_83" data-name="Path 83" d="M138.482,26.944l-2.676.06-1.4-10.217h3.384Z" transform="translate(-134.408 -12.28)"/>
    <path id="Path_84" data-name="Path 84" d="M149.766,25.747h-8.488l-.52-3.766L139.9,9.3l-.041-.381-.179-2.709h11.7l-.184,2.709h-.019l-.883,13.059Zm2.8-4.874.69-10.158h3.339L155.2,20.937Zm-14.77-10.158.69,10.158-2.676.06-1.4-10.217Z" transform="translate(-134.408 -6.209)"/>
    <path id="Path_85" data-name="Path 85" d="M157.966,57.49v1.84H143.708V57.49l1.389-.635.626-.285h10.228l.626.285Z" transform="translate(-139.746 -35.115)"/>
  </g>
</svg>

                </router-link>
            </li>
            <!-- Only show this if user is logged in -->
            <li v-if="isLoggedIn" class="nav-item">
              <router-link
                class="nav-link"
                active-class="active"
                :to="{ name: 'Home' }"
                >
<svg id="Group_101" data-name="Group 101" xmlns="http://www.w3.org/2000/svg" width="23.857" height="23.431" viewBox="0 0 23.857 23.431">
  <rect id="Rectangle_102" data-name="Rectangle 102" width="6.816" height="7.242" transform="translate(8.52)"/>
  <rect id="Rectangle_103" data-name="Rectangle 103" width="6.816" height="6.39" transform="translate(8.52 8.946)"/>
  <rect id="Rectangle_104" data-name="Rectangle 104" width="6.816" height="6.39" transform="translate(0 8.946)"/>
  <path id="Path_92" data-name="Path 92" d="M67.294,51.05v6.39h-3.51a3.3,3.3,0,0,1-3.306-3.306V51.05Z" transform="translate(-60.478 -34.009)"/>
  <rect id="Rectangle_105" data-name="Rectangle 105" width="6.816" height="6.39" transform="translate(8.52 17.04)"/>
  <path id="Path_93" data-name="Path 93" d="M107.294,14.356v3.936h-6.816V11.05h3.51a3.3,3.3,0,0,1,3.306,3.306" transform="translate(-83.438 -11.05)"/>
  <rect id="Rectangle_106" data-name="Rectangle 106" width="6.816" height="6.39" transform="translate(17.04 8.946)"/>
  <path id="Path_94" data-name="Path 94" d="M107.294,51.05v3.084a3.3,3.3,0,0,1-3.306,3.306h-3.51V51.05Z" transform="translate(-83.438 -34.009)"/>
</svg>

                </router-link>
            </li>

<!-- Only show this if user is logged in -->
            <li v-if="isLoggedIn" class="nav-item">
              <router-link
                class="nav-link"
                active-class="active"
                :to="{ name: 'Home' }"
                >
<svg xmlns="http://www.w3.org/2000/svg" width="30.29" height="17.824" viewBox="0 0 30.29 17.824">
  <path id="Path_95" data-name="Path 95" d="M317.644,21.976a3.257,3.257,0,0,0-1.062-.178,3.155,3.155,0,0,0-1.03.17,8.878,8.878,0,0,0-8.4-5.919H289.477v6.543l8.772,2.024c0,.114-.008.229-.008.343a8.917,8.917,0,0,0,17.315,3,3.166,3.166,0,1,0,2.087-5.978m-10.41,5.863a3.158,3.158,0,1,1,3.161-3.161,3.16,3.16,0,0,1-3.161,3.161" transform="translate(-289.477 -16.049)"/>
</svg>
                </router-link>
            </li>
            <!-- Do not show if user is logged in -->
            <li v-if="!isLoggedIn" class="nav-item">
              <router-link
                class="nav-link"
                active-class="active"
                :to="{ name: 'Login' }"
                >
                  Login / Signup
                </router-link
              >
            </li>
            <li v-if="isLoggedIn" class="nav-item">
              <a href="#" @click.prevent="handleLogout()" class="nav-link">Logout</a
              >
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <div class="container pt-3">
      <div
        :key="index"
        v-for="(error, index) in store.getters.errors"
        class="alert alert-danger alert-dismissible fade show"
        role="alert"
      >
        {{ error.message }}
        <button
          @click="dismissError(index)"
          type="button"
          class="btn-close"
          data-bs-dismiss="alert"
          aria-label="Close"
        ></button>
      </div>
      <router-view @login="handleLogin" />
    </div>
  </div>
</template>

<script setup>
import { useStore } from 'vuex'
import { inject, ref } from '@vue/runtime-core'
const apiClient = inject('$api', {})
const store = useStore()
const handleLogin = () => {
  isLoggedIn.value = true
}
const handleLogout = () => {
  isLoggedIn.value = false
  apiClient.logout()
}
const dismissError = (index) => {
  const errors = store.getters.errors
  errors.splice(index, 1)
  store.commit('errors', errors)
}
const isLoggedIn = ref(apiClient.isLoggedIn())
</script>

<style lang="scss">
@import "../node_modules/bootstrap/scss/bootstrap.scss";
</style>
