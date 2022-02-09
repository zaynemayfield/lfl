<template>
  <div class="card">
<svg xmlns="http://www.w3.org/2000/svg" width="375" height="103" viewBox="0 0 375 103">
  <rect id="Rectangle_110" data-name="Rectangle 110" width="375" height="103" fill="#8eef50"/>
  <text id="We_have_a_relegation_promotion_system._The_top_2_teams_will_be_promoted_next_season._" data-name="We have a relegation &amp; promotion
system. The top 2 teams will be
promoted next season. " transform="translate(33 28)" font-size="20" font-family="SegoeUI-Bold, Segoe UI" font-weight="700"><tspan x="0" y="0">We have a relegation &amp; promotion</tspan><tspan x="0" y="24">system. The top 2 teams will be</tspan><tspan x="0" y="48">promoted next season. </tspan></text>
</svg>

    <div class="card-body">
      <h1 class="card-title">
<svg xmlns="http://www.w3.org/2000/svg" width="321" height="139.759" viewBox="0 0 321 139.759">
  <g id="Group_97" data-name="Group 97" transform="translate(-26 -236)">
    <path id="Path_17" data-name="Path 17" d="M17.343,0,0,24.883l48.524,2.293L60.44,2.092h0Z" transform="translate(27 238.758)"/>
    <text id="_3" data-name="3" transform="translate(51 260)" fill="#fff" font-size="20" font-family="SegoeUI, Segoe UI"><tspan x="0" y="0">3</tspan></text>
    <text id="Invite_friends" data-name="Invite friends" transform="translate(97 260)" font-size="22" font-family="SegoeUI, Segoe UI"><tspan x="0" y="0">Invite friends</tspan></text>
  </g>
  <text id="In_some_instances_we_may_not_be_able_to_add_friends_on_the_same_team_as_you._But_we_can_always_get_them_on_a_rival_team_:P" data-name="In some instances we may not be able
to add friends on the same team as
you. But we can always get them on a
rival team :P" transform="translate(1 62.759)" font-size="18" font-family="SegoeUI-Bold, Segoe UI" font-weight="700"><tspan x="0" y="0">In some instances we may not be able</tspan><tspan x="0" y="24">to add friends on the same team as</tspan><tspan x="0" y="48">you. But we can always get them on a</tspan><tspan x="0" y="72">rival team :P</tspan></text>
</svg>

      </h1>

      <!-- Get all leagues within a league category, turn and grab the league Id -->
      <form enctype="multipart/form-data" name="register" @submit.prevent="handleInviteFriend">
        <input type="hidden" name="userId" :value="userId">
        <div class="row mb-3">
          <div class="col">
            <div class="form__group field">
              <Label><span style="font-size:20px; font-weight: 700;">Friend 1:</span></Label>
              <input type="tel" class="form__field" id="phone" placeholder="Phone Number" name="phone[]" required />
            </div>
          </div>
        </div>
        <div class="row mb-3">
          <div class="col">
            <div class="form__group field">
              <Label><span style="font-size:20px; font-weight: 700;">Friend 2:</span></Label>
              <input type="tel" class="form__field" id="phone" placeholder="Phone Number" name="phone[]" />
            </div>
          </div>
        </div>
        <div class="row mb-3">
          <div class="col">
            <div class="form__group field">
              <Label><span style="font-size:20px; font-weight: 700;">Friend 3:</span></Label>
              <input type="tel" class="form__field" id="phone" placeholder="Phone Number" name="phone[]" />
            </div>
          </div>
        </div>
        <div class="row mb-3">
          <div class="col">
            <button>+ Add Another Friend to Invite</button>
          </div>
        </div>
        <div class="row mb-2">
          <div class="col">
            <span style="font-size:20px; font-weight: 700;">No thanks, just me </span><input @click="doNotInviteFriends = !doNotInviteFriends" id="no" type="checkbox" name="no" style="width: 20px; height: 20px;" />
          </div>
        </div>
        <div class="row align-items-center">
          <div class="col mt-3">
            <!-- Show this when user wants to invite friends -->
            <button v-if="!doNotInviteFriends" type="submit" style="padding: 0; border: none; background: none;">
              <svg xmlns="http://www.w3.org/2000/svg" width="313" height="42" viewBox="0 0 313 42">
                <rect id="Rectangle_25" data-name="Rectangle 25" width="313" height="42" fill="#8eef50"/>
                <text id="Next" transform="translate(20 29)" font-size="22" font-family="SegoeUI, Segoe UI"><tspan x="0" y="0">Next</tspan></text>
                <path id="Polygon_1" data-name="Polygon 1" d="M9.5,0,19,14H0Z" transform="translate(295.693 11.5) rotate(90)"/>
              </svg>
            </button>

              <!-- SHow this when user does not want to invite friends -->
            <router-link v-if="doNotInviteFriends" :to="{ name: 'SignAndDraft', params: { userId: userId } }">
              <svg xmlns="http://www.w3.org/2000/svg" width="313" height="42" viewBox="0 0 313 42">
                <rect id="Rectangle_25" data-name="Rectangle 25" width="313" height="42" fill="#8eef50"/>
                <text id="Next" transform="translate(20 29)" font-size="22" font-family="SegoeUI, Segoe UI"><tspan x="0" y="0">Next</tspan></text>
                <path id="Polygon_1" data-name="Polygon 1" d="M9.5,0,19,14H0Z" transform="translate(295.693 11.5) rotate(90)"/>
              </svg>
            </router-link>
          </div>
        </div>
        
      </form>
    </div>

  </div>
</template>

<style scoped>
  #registrationHeader {
    background-color: #8eef50;
    transform: translate(33 81);
    font-size: 20px;
    font-family: SegoeUI-Bold, Segoe UI;
    font-weight: 700;
  }
.form__group {
  position: relative;
  padding: 15px 0 0;
  margin-top: 10px;
  width: 350px;
}

.form__field {
  font-family: inherit;
  width: 100%;
  border: 0;
  border-bottom: 2px solid #000000;
  outline: 0;
  font-size: 1.3rem;
  color: #000000;
  padding: 7px 0;
  background: transparent;
  transition: border-color 0.2s;

  &::placeholder {
    color: transparent;
  }

  &:placeholder-shown ~ .form__label {
    font-size: 1.3rem;
    cursor: text;
    top: 20px;
  }
}

.form__label {
  position: absolute;
  top: 0;
  display: block;
  transition: 0.2s;
  font-size: 1rem;
  color: #C9C9C9;
}

.form__field:focus {
  ~ .form__label {
    position: absolute;
    top: 0;
    display: block;
    transition: 0.2s;
    font-size: 1rem;
    color: #11998e;
    font-weight:700;
  }
  padding-bottom: 6px;
  font-weight: 700;
  border-width: 3px;
  border-image: linear-gradient(to right,#8EEF50,#38ef7d);
  border-image-slice: 1;
}
/* reset input */
.form__field{
  &:required,&:invalid { box-shadow:none; }
}
/* demo */
body {
  font-family: 'Poppins', sans-serif;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  font-size: 1.5rem;
  background-color:#222222;
}
</style>

<script setup>
import { inject, ref } from '@vue/runtime-core'
import { useRoute } from 'vue-router'
const apiClient = inject('$api', {})
const route = useRoute()
const userId = route.params.id
const doNotInviteFriends = ref(false)
const handleInviteFriend = (e) => {
  const data = new FormData(e.target)
  apiClient.inviteFriendCreate(data)
}
</script>
