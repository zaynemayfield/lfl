<template>
  <div class="card">
<svg xmlns="http://www.w3.org/2000/svg" width="375" height="93" viewBox="0 0 375 93">
  <rect id="Rectangle_20" data-name="Rectangle 20" width="375" height="93" fill="#8eef50"/>
  <text id="You_don_t_need_to_wait_for_a_captain._We_ll_draft_you_to_a_team_automatically_" data-name="You don’t need to wait for a
captain. We’ll draft you to a team
automatically!" transform="translate(33 28)" font-size="20" font-family="SegoeUI-Bold, Segoe UI" font-weight="700"><tspan x="0" y="0">You don’t need to wait for a</tspan><tspan x="0" y="24">captain. We’ll draft you to a team</tspan><tspan x="0" y="48">automatically!</tspan></text>
</svg>

    <div class="card-body">
      <h1 class="card-title">
        <svg xmlns="http://www.w3.org/2000/svg" width="180" height="30" viewBox="0 0 173 30">
          <g id="Group_99" data-name="Group 99" transform="translate(-24 -190)">
            <path id="Path_17" data-name="Path 17" d="M17.343,0,0,24.883l48.524,2.293L60.44,2.092h0Z" transform="translate(24 192.758)"/>
            <text id="_1" data-name="1" transform="translate(54 213)" fill="#fff" font-size="20" font-family="SegoeUI, Segoe UI"><tspan x="0" y="0">1</tspan></text>
            <text id="Player_info" data-name="Player info" transform="translate(94 214)" font-size="22" font-family="SegoeUI, Segoe UI"><tspan x="0" y="0">Player info</tspan></text>
          </g>
        </svg>
      </h1>
      <form enctype="multipart/form-data" name="register" @submit.prevent="handleRegister">
        <div class="form__group field">
          <input type="input" class="form__field" id="firstName" placeholder="First Name" name="firstName" required />
        </div>
        <div class="form__group field">
          <input type="input" class="form__field" id="lastName" placeholder="Last Name" name="lastName" required />
        </div>
        <div class="form__group field">
          <input type="text" class="form__field" id="dob" placeholder="Date of Birth" name="dob" onfocus="(this.type='date')" required />
        </div>
        <div class="form__group field">
          <input type="tel" class="form__field" id="phone" placeholder="Phone: 555-555-5555" name="phone" required />
        </div>
        <div class="form__group field">
          <input type="email" class="form__field" id="email" placeholder="Email" name="email" required />
        </div>
        <div class="form__group field">
          <input type="password" class="form__field" id="password" placeholder="Password" name="password" required />
        </div>
        <label class="mt-3" style="font-size:20px; font-weight: 700;">Shirt size:</label><br />
        <input id="S" type="checkbox" name="shirtSize" value="S" onclick="if(this.checked) {document.register.M.checked=false; document.register.XL.checked=false; document.register.L.checked=false;}" style="width: 20px; height: 20px;" /><span style="font-size:20px; font-weight: 700;"> S </span>
        <input id="M" type="checkbox" name="shirtSize" value="M" onclick="if(this.checked) {document.register.S.checked=false; document.register.XL.checked=false; document.register.L.checked=false;}" style="width: 20px; height: 20px;" /><span style="font-size:20px; font-weight: 700;"> M </span>
        <input id="L" type="checkbox" name="shirtSize" value="L" onclick="if(this.checked) {document.register.XL.checked=false; document.register.S.checked=false; document.register.M.checked=false;}" style="width: 20px; height: 20px;" /><span style="font-size:20px; font-weight: 700;"> L </span>
        <input id="XL" type="checkbox" name="shirtSize" value="XL" onclick="if(this.checked) {document.register.L.checked=false; document.register.S.checked=false; document.register.M.checked=false;}" style="width: 20px; height: 20px;" /><span style="font-size:20px; font-weight: 700;"> XL </span>
        <br />
        <label class="mt-3" style="font-size:20px; font-weight: 700;">Sex:</label><br />
        <input id="male" type="checkbox" name="sex" value="Male" onclick="if(this.checked) {document.register.female.checked=false;}" style="width: 20px; height: 20px;" /><span style="font-size:20px; font-weight: 700;"> Male </span>
        <input id="female" type="checkbox" name="sex" value="Female" onclick="if(this.checked) {document.register.male.checked=false;}" style="width: 20px; height: 20px;" /><span style="font-size:20px; font-weight: 700;"> Female </span>
        <br />
        <label class="mt-3" style="font-size:20px; font-weight: 700;">Do you play keeper?</label><br />
        <input id="yes" type="checkbox" name="keeper" value="1" onclick="if(this.checked) {document.register.no.checked=false;}" style="width: 20px; height: 20px;" /><span style="font-size:20px; font-weight: 700;"> Yes </span>
        <input id="no" type="checkbox" name="keeper" value="0" onclick="if(this.checked) {document.register.yes.checked=false;}" style="width: 20px; height: 20px;" /><span style="font-size:20px; font-weight: 700;"> No </span>
        <br />
        <label class="mt-3" style="font-size:20px; font-weight: 700;">Do you agree to the <a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal">terms?</a></label><br />
        <span style="font-size:20px; font-weight: 700;"><input id="terms" type="checkbox" name="terms" value="1" style="width: 20px; height: 20px;" />  Yes </span>

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
          <div class="col">
            <router-link :to="{ name: 'Login' }">Existing User? Log In.</router-link>
          </div>
        </div>
      </form>
    </div>

    <!-- Modal -->
    <div id="exampleModal" class="modal fade" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
          <div class="modal-header">
            <h5 id="exampleModalLabel" class="modal-title">Terms of Service</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            You agree to all these terms that might even lead to injury or death.
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          </div>
        </div>
      </div>
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
import { inject } from '@vue/runtime-core'
const apiClient = inject('$api', {})
const handleRegister = (e) => {
  const data = new FormData(e.target)
  apiClient.register(data)
}

</script>
