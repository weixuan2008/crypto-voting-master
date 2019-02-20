<template>
  <div class="id_vote">
    <div class="vote_address">
      <section> 
        <b-table
              :data="isEmpty ? [] : addressData"
              :bordered="isBordered"
              :narrowed="isNarrowed">

              <template slot-scope="props">
                  <b-table-column field="contractAddress" label="Contract Address">
                    {{ props.row.contractAddress }}
                  </b-table-column>

                  <b-table-column field="accountAddress" label="Account Address">
                    {{ props.row.accountAddress }}
                  </b-table-column>
              </template>

              <template slot="empty">
                  <section class="section">
                      <div class="content has-text-grey has-text-centered">
                          <p>
                              <b-icon
                                  icon="emoticon-sad"
                                  size="is-large">
                              </b-icon>
                          </p>
                          <p>Nothing here.</p>
                      </div>
                  </section>
              </template>
          </b-table>
        </section>   
    </div>

    <div class="vote_candidates">
      <b-select v-model="selectedCandidate" expanded placeholder="Select candidate" icon="user" icon-pack="fas">
        <option v-for="option in votesData" :value="option.id" :key="option.name">{{ option.name }}</option>
      </b-select>
    </div>

    <div class="vote_button">
      <button class="button is-dark" @click="setVote()">Vote Me</button>
    </div>
  </div>  
</template>


<script lang="js">
import Election from '../../build/contracts/Election.json'

export default {
  name: 'vote',
  data () {
    return {
      contractAddress: '0xbe9c2c487bf791c85a4b96ea056c1d075ab4f154',
      selectedCandidate: null,
      currentAddress: null,
      electionContract: Election,
      votesData: [],
      addressData: [],
      // seperator
      isEmpty: false,
      isBordered: true,
      isNarrowed: true
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

      // var web3 = new Web3(web3.currentProvider)
      let electionContract = window.web3.eth.Contract(this.electionContract.abi, this.contractAddress)
      this.contractAddress = electionContract.options.address
      let candidatesCount = await electionContract.methods.candidatesCount().call()
      this.votesData = []
      let isOpening = await electionContract.methods.isOpening.call()

      for (let i = 0; i < candidatesCount; i++) {
        let candidates = await electionContract.methods.candidates(i + 1).call()

        let sex = 'Male'
        if (candidates.gender === '0') {
          sex = 'Female'
        }
        this.votesData.push({id: i + 1, name: candidates.name, gender: sex, country: candidates.country, votes: candidates.voteCount, status: isOpening ? 'opening' : 'closed'})
      }
      this.addressData.push({contractAddress: this.contractAddress, accountAddress: this.currentAddress})
    },
    async setVote () {
      let electionContract = window.web3.eth.Contract(this.electionContract.abi, this.contractAddress)
      await electionContract.methods.vote(this.selectedCandidate).send({from: this.currentAddress})
      // let vote = await electionContract.methods.vote(this.selectedCandidate).send({from: this.currentAddress})
      // console.log(vote)
      location.reload()
    }
  },
  created () {
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
  .id_vote
  {
    padding-bottom:60px;
    width: 90%;
    background-color: #ffffff;
    text-align: center;
    margin: 0 auto;
  }
  .vote_address {
    width: 100%;
  }
  .vote_candidates {
    width: 100%;
    margin-top: 50px;
  }
  .vote_button
  {
    padding-top: 50px;
    width: 100%;
    /*background-color: #0000ff;*/
    text-align: right
  }
</style>