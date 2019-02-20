<template>
  <div class="id_admin">
    <div class="admin_form">
     <section>
        <b-field label="UID" align="left">
            <b-input placeholder="UID"  maxlength="18" v-model="uid" required></b-input>
        </b-field>
        <b-field label="Name" align="left">
            <b-input placeholder="Name" maxlength="30" icon="account" v-model="name" required></b-input>
        </b-field>
        <b-field label="Title" align="left">
            <b-select placeholder="Select a Title" v-model="titleselected" expanded required>
                <option value="President">President</option>
                <option value="CEO">CEO</option>
                <option value="Governor">Governor</option>
                <option value="Founder and CEO">Founder and CEO</option>
            </b-select>
        </b-field>

        <b-field label="Affiliation" align="left">
            <b-input placeholder="Affiliation" maxlength="30" icon="account" v-model="affiliation" required></b-input>
        </b-field>     
                     
        <b-field label="Gender" align="left">
            <b-select placeholder="Select a gender" icon="user" icon-pack="fas" v-model="genderselected" expanded required>
                <option value="male">Male</option>
                <option value="female">Female</option>
            </b-select>
        </b-field>

        <b-field label="Nation" align="left">
            <b-select placeholder="Select a country" icon="globe" icon-pack="fas" v-model="countryselected" expanded required>
                <option v-for="(value, key) in country" v-bind:prop="value" v-bind:key="key">{{ key }} - {{value}}</option>
            </b-select>
        </b-field>

        <b-field label="PIC URL" align="left">
            <b-input placeholder="PIC URL"  maxlength="30" v-model="picurl" required></b-input>
        </b-field>
    </section>
    </div> 

    <div class="add_button">
      <button class="button is-dark" @click="submit()">Submit</button>
    </div> 
  </div>
</template>


<script lang="js">
import Election from '../../build/contracts/Election.json'
import countryData from '../../static/country-select.json'

export default {
  name: 'admin',
  data () {
    return {
      uid: '',
      name: '',
      titleselected: '',
      affiliation: '',
      genderselected: '',
      countryselected: '',
      picurl: '',
      contractAddress: '0xbe9c2c487bf791c85a4b96ea056c1d075ab4f154',
      selectedCandidate: null,
      currentAddress: null,
      electionContract: Election,
      country: countryData.country,
      addressData: []
    }
  },
  methods: {
    async getValue () {
      window.web3.eth.getCoinbase((err, coinbase) => {
        if (!err) {
          this.currentAddress = coinbase
          console.log(coinbase)
        } else {
          console.log('Failed to get coinbase!')
        }
      })

      this.addressData.push({contractAddress: this.contractAddress, accountAddress: this.currentAddress})
    },
    async submit () {
      let electionContract = window.web3.eth.Contract(this.electionContract.abi, this.contractAddress)

      let sex = 1
      if (this.genderselected === 'female') {
        sex = 0
      }
      // let candidate = await electionContract.methods.addCandidate(this.uid, this.name, this.titleselected, this.affiliation, sex, this.countryselected.substr(0, 2)).send({from: this.currentAddress})
      await electionContract.methods.addCandidate(this.uid, this.name, this.titleselected, this.affiliation, sex, this.countryselected.substr(0, 2), this.picurl).send({from: this.currentAddress})
      location.reload()
    }
  },
  created () {
    console.log('--------created------------')
    this.getValue()
    window.ethereum.on('accountsChanged', function (accounts) {
      // Time to reload your interface with accounts[0]!
      console.log('--------accountsChanged------------')
      location.reload()
    })
    window.ethereum.on('networkChanged', function (netId) {
      // Time to reload your interface with netId
      console.log('--------networkChanged------------')
      location.reload()
    })
  }
}
</script>


<style>
  .id_admin
  {
    padding-bottom:60px;
    width: 90%;
    text-align: center;
    margin: 0 auto;
  }
  .admin_form {
    width: 100%;
  }
  .add_button
  {
    padding-top: 50px;
    width: 100%;
    text-align: right;
    margin-bottom: 20px;
  }
</style>