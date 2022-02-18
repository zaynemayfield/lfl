<template>
  <div class="card">
<svg xmlns="http://www.w3.org/2000/svg" width="375" height="94" viewBox="0 0 375 94">
  <rect id="Rectangle_109" data-name="Rectangle 109" width="375" height="94" fill="#8eef50"/>
  <text id="We_re_building_leagues_for_every_skill_level_so_don_t_worry_there_s_a_team_for_you_" data-name="We’re building leagues for every
skill level, so don’t worry, there’s
a team for you! " transform="translate(33 28)" font-size="20" font-family="SegoeUI-Bold, Segoe UI" font-weight="700"><tspan x="0" y="0">We’re building leagues for every</tspan><tspan x="0" y="24">skill level, so don’t worry, there’s</tspan><tspan x="0" y="48">a team for you! </tspan></text>
</svg>

    <div class="card-body">
      <h1 class="card-title">
<svg xmlns="http://www.w3.org/2000/svg" width="241" height="89.759" viewBox="0 0 241 89.759">
  <g id="Group_96" data-name="Group 96" transform="translate(-27 -236)">
    <path id="Path_17" data-name="Path 17" d="M17.343,0,0,24.883l48.524,2.293L60.44,2.092h0Z" transform="translate(27 238.758)"/>
    <text id="_2" data-name="2" transform="translate(51 260)" fill="#fff" font-size="20" font-family="SegoeUI, Segoe UI"><tspan x="0" y="0">2</tspan></text>
    <text id="Level_" data-name="Level " transform="translate(97 260)" font-size="22" font-family="SegoeUI, Segoe UI"><tspan x="0" y="0">Level </tspan></text>
  </g>
  <text id="You_can_join_multiple_leagues_Games_are_between_6pm_and_11pm." data-name="You can join multiple leagues!
Games are between 6pm and 11pm." transform="translate(0 52.759)" font-size="14" font-family="SegoeUI-Bold, Segoe UI" font-weight="700"><tspan x="0" y="0">You can join multiple leagues!</tspan><tspan x="0" y="19">Games are between 6pm and 11pm.</tspan></text>
  <text id="_Leagues_arranged_from_highest_to_lowest_" data-name="(Leagues arranged from highest to lowest)" transform="translate(0 86.759)" font-size="12" font-family="SegoeUI-Bold, Segoe UI" font-weight="700"><tspan x="0" y="0">(Leagues arranged from highest to lowest)</tspan></text>
</svg>

      </h1>

      <!-- Get all leagues within a league category, turn and grab the league Id -->
      <form enctype="multipart/form-data" name="register" @submit.prevent="handleLeagueRegister">
        <input type="hidden" name="userId" :value="userId">

        <!-- SHOW SEASON -->
        <div :key="index" v-for="(season, index) in seasons">
        <h4><strong>{{ season.name }} Season: {{ dateFormat(season.startDate) }} - {{ dateFormat(season.endDate) }} </strong></h4>
         <div :id="'season'+index" v-show="'season'+index">

        <!-- SHOW Category -->
         <div :key="index" v-for="(leagueCategory, index) in leagueCategories">
           <h3><strong>{{ leagueCategory.name }} </strong> <span style="font-size: 14px">(Ages: {{ leagueCategory.ageFrom }} - {{ leagueCategory.ageTo }})</span></h3> <hr>
            
            <!-- SHOW League -->
            <!-- Use a filter to get only the leagues for this season and category -->
            <div :key="index" v-for="(leagueSeason, index) in leagueSeasons.filter(leagueSeason => leagueSeason.seasonId === season.id && leagueSeason.league.leagueCategoryId === leagueCategory.id)" class="row mb-1">
             <div class="col">
               <input v-if="eligibleForLeague(leagueCategory.sex, sex, leagueCategory.ageFrom, leagueCategory.ageTo, age)" :id="leagueSeason.id" type="checkbox" name="league[]" :value="leagueSeason.id" style="width: 20px; height: 20px;" /><span style="font-size:20px; font-weight: 700;"> &nbsp; {{ leagueSeason.league.leagueName }} </span><span style="font-size: 14px;"> &nbsp; {{ leagueSeason.league.dayOfWeek }}s - {{ financialFormat(leagueSeason.league.price) }} </span>
              </div>
           </div>
           
            <br />
            </div>
        </div>
        </div>
        <div class="row align-items-center">
          <div class="col mt-3">
            <div v-if="checkEligibility < 1">
              <div class="row mb-2">
                <div class="col">
              <h4>
                <strong>No Leagues available for you... </strong><span style="font-size: 16px"> Let us know that you want a league and when we get enough people we'll notify you that we have an eligible league.</span>
              </h4>
                </div>
              </div>
              <button type="button" @click="addToWaitList(userId)" style="padding: 0; border: none; background: none;">
                <svg xmlns="http://www.w3.org/2000/svg" width="313" height="42" viewBox="0 0 313 42">
                  <rect id="Rectangle_25" data-name="Rectangle 25" width="313" height="42" fill="#8eef50"/>
                  <text id="Next" transform="translate(20 29)" font-size="22" font-family="SegoeUI, Segoe UI"><tspan x="0" y="0">I Want a League!</tspan></text>
                  <path id="Polygon_1" data-name="Polygon 1" d="M9.5,0,19,14H0Z" transform="translate(295.693 11.5) rotate(90)"/>
                </svg>
              </button>
            </div>
            <button v-if="checkEligibility > 0" type="submit" style="padding: 0; border: none; background: none;">
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
import { inject, onBeforeMount, ref } from '@vue/runtime-core'
import { useRoute } from 'vue-router'
import financialFormat from '../utilities/financialFormat'
import dateFormat from '../utilities/dateFormat'
const seasons = ref({})
const leagueSeasons = ref({})
const leagueCategories = ref({})
const checkEligibility = ref(0)
const apiClient = inject('$api', {})
const route = useRoute()
const userId = route.params.id
const sex = route.params.sex
const age = route.params.age

const eligibleForLeague = (leagueSex, sex, leagueAgeFrom, leagueAgeTo, age) => {
  const testSex = leagueSex === 'Coed' || leagueSex === sex
  const testAge = leagueAgeFrom < age && leagueAgeTo > age
  console.log('sex: ' + testSex + ' age: ' + testAge)
  if (!testSex || !testAge) {
    return false
  }
  if (checkEligibility.value === 0) {
    checkEligibility.value++
    console.log('PLUS ONE HERE')
  }
  console.log(checkEligibility)
  return true
  }

const handleLeagueRegister = (e) => {
  const data = new FormData(e.target)
  apiClient.leagueRegister(data)
}

const addToWaitList = (userId) => {
  apiClient.addToWaitList(userId)
}

// const getLeagueCategories = async () => {
//   const leagueCategoriesResponse = await apiClient.getLeagueCategories()
//   leagueCategories.value = leagueCategoriesResponse?.leagueCategories
//   console.log(leagueCategories)
// }
const getLeagueSeasons = async () => {
  const leagueSeasonResponse = await apiClient.getLeagueSeasons()
  const leagueSeasonData = leagueSeasonResponse?.leagueSeasons
  const leagueCategoriesArray = []
  const seasonsArray = []
  for (const leagueSeason of leagueSeasonData) {
    // by using the ID as the array key, we avoid making duplicates
    // but we end up with a non-continuous array (if the first ID is 1, then array[0] is undefined)
    leagueCategoriesArray[leagueSeason.league.leagueCategoryId] = leagueSeason.league.leaguecategory
    seasonsArray[leagueSeason.season.id] = leagueSeason.season
  }
  // array.filter(Boolean) is shorthand for array.filter(value => !!value)
  // -- filter out all false-y values (like undefined)
  seasons.value = seasonsArray.filter(Boolean)
  leagueCategories.value = leagueCategoriesArray.filter(Boolean)
  leagueSeasons.value = leagueSeasonData
}

// const logThis = (data) => {
//   console.log(data)
// }

onBeforeMount(getLeagueSeasons)
// Choose season Drop Down box
// Also need to check current season and grab only leagues that are open for the season
</script>
