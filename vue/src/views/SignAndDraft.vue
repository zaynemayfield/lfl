<template>
  <div class="card">
<svg xmlns="http://www.w3.org/2000/svg" width="375" height="134" viewBox="0 0 375 134">
  <rect id="Rectangle_111" data-name="Rectangle 111" width="375" height="108" fill="#8eef50"/>
  <text id="We_don_t_have_teams_we_have_clubs._The_Lleveland_Locos_have_a_team_in_each_division._" data-name="We don’t have teams, we have
clubs. The “Lleveland Locos” have
a team in each division.

 " transform="translate(33 33)" font-size="20" font-family="SegoeUI-Bold, Segoe UI" font-weight="700"><tspan x="0" y="0">We don’t have teams, we have</tspan><tspan x="0" y="24">clubs. The “Lleveland Locos” have</tspan><tspan x="0" y="48">a team in each division.</tspan><tspan x="0" y="72"></tspan><tspan x="0" y="96"> </tspan></text>
</svg>

    <div class="card-body">
      <h1 class="card-title">
<svg xmlns="http://www.w3.org/2000/svg" width="218" height="30" viewBox="0 0 210 30">
  <g id="Group_98" data-name="Group 98" transform="translate(-27 -236)">
    <path id="Path_17" data-name="Path 17" d="M17.343,0,0,24.883l48.524,2.293L60.44,2.092h0Z" transform="translate(27 238.758)"/>
    <text id="_4" data-name="4" transform="translate(51 260)" fill="#fff" font-size="20" font-family="SegoeUI, Segoe UI"><tspan x="0" y="0">4</tspan></text>
    <text id="Sign_and_Draft" data-name="Sign and Draft" transform="translate(97 260)" font-size="22" font-family="SegoeUI, Segoe UI"><tspan x="0" y="0">Sign and Draft</tspan></text>
  </g>
</svg>

      </h1>

      <!-- Get all leagues within a league category, turn and grab the league Id -->
      <form enctype="multipart/form-data" name="register" @submit.prevent="handleInviteFriend">
        <!-- <input type="hidden" name="userId" :value="userId"> -->
        <!-- SHow the leagues that they are signing up for and have not paid for -->

        <!-- Show the digital Player Card information and price -->

        <!-- show the jersey information and price -->

        <!-- Show Total Amount owed -->

        <!-- Show card Information and integration with stripe or other -->

        <div class="row align-items-center">
          <div class="col mt-3">
            <button type="submit" style="padding: 0; border: none; background: none;">
              <svg xmlns="http://www.w3.org/2000/svg" width="313" height="42" viewBox="0 0 313 42">
                <rect id="Rectangle_25" data-name="Rectangle 25" width="313" height="42" fill="#8eef50"/>
                <text id="Next" transform="translate(20 29)" font-size="22" font-family="SegoeUI, Segoe UI"><tspan x="0" y="0">Next</tspan></text>
                <path id="Polygon_1" data-name="Polygon 1" d="M9.5,0,19,14H0Z" transform="translate(295.693 11.5) rotate(90)"/>
              </svg>
              </button>
          </div>
        </div>
        
      </form>
    </div>

  </div>
</template>

<script setup>
import { inject } from '@vue/runtime-core'
// import { useRoute } from 'vue-router'
const apiClient = inject('$api', {})
// const route = useRoute()
// const userId = route.params.id
const handleInviteFriend = (e) => {
  const data = new FormData(e.target)
  apiClient.inviteFriendCreate(data)
}
</script>
