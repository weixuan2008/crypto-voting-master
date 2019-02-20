<template>
  <div class="id_candidates">
    <section>        
        <b-table
            :data="isEmpty ? [] : votesData"
            :bordered="isBordered"
            :narrowed="isNarrowed"
            :paginated="isPaginated"
            :per-page="perPage"
            :current-page.sync="currentPage"
            :pagination-simple="isPaginationSimple"
            :default-sort-direction="defaultSortDirection"
            :selected.sync="selected"
            default-sort="id">

            <template slot-scope="props">
                <b-table-column field="id" label="ID" width="40" sortable numeric>
                    {{ props.row.id }}
                </b-table-column>

                <b-table-column field="name" label="Name" sortable>
                    {{ props.row.name }}
                </b-table-column>

                <b-table-column field="title" label="Title" sortable>
                    {{ props.row.title }}
                </b-table-column>

                <b-table-column field="affiliation" label="Affiliation" sortable>
                    {{ props.row.affiliation }}
                </b-table-column>

                <b-table-column field="gender" label="Gender" sortable>
                    <b-icon pack="fas"
                        :icon="props.row.gender === 'Male' ? 'mars' : 'venus'">
                    </b-icon>
                    {{ props.row.gender }}
                </b-table-column>

                <b-table-column field="country" label="Country" sortable>
                  <div class="country">
                    <div class="country_name">
                        {{ props.row.country }}
                    </div> 
                    <div class="country_flag">
                      <flag :iso= "props.row.country"/>
                    </div>  
                  </div>
                </b-table-column>

                <b-table-column field="votes" label="Votes" sortable centered>
                    <span class="tag is-success">
                        {{ props.row.votes }}
                    </span>
                </b-table-column>

                <b-table-column field="status" label="Status" centered>
                    <span class="tag is-info">
                        {{ props.row.status }}
                    </span>
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
</template>


<script lang="js">
// import Web3 from 'web3'
// http://cw.hubwiz.com/card/c/web3.js-1.0/1/2/1/
// https://buefy.org/documentation/start
// https://web3js.readthedocs.io/en/1.0/
// https://web3js.readthedocs.io/en/1.0/web3-eth.html?highlight=coinbase
// https://buefy.org/documentation/layout
// https://metamask.github.io/metamask-docs/API_Reference/Ethereum_Provider#ethereum.on%28eventname%2C-callback%29
// https://fontawesome.com/icons?d=gallery
// https://buefy.org/documentation/tag/

import Election from '../../build/contracts/Election.json'

export default {
  name: 'candidates',
  data () {
    return {
      contractAddress: '0xbe9c2c487bf791c85a4b96ea056c1d075ab4f154',
      selectedCandidate: null,
      currentAddress: null,
      electionContract: Election,
      addressData: [],
      votesData: [],
      // seperator
      isEmpty: false,
      isBordered: false,
      selected: null,
      isNarrowed: false,
      isPaginated: true,
      isPaginationSimple: false,
      defaultSortDirection: 'asc',
      currentPage: 1,
      perPage: 10
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
        this.votesData.push({id: i + 1, name: candidates.name, title: candidates.title, affiliation: candidates.affiliation, gender: sex, country: candidates.country, votes: candidates.voteCount, status: isOpening ? 'opening' : 'closed'})
      }

      this.addressData.push({contractAddress: this.contractAddress, accountAddress: this.currentAddress})
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
  },
  activated () {
    var account = window.web3.eth.accounts[0]
    var accountInterval = setInterval(function () {
      if (window.web3.eth.accounts[0] !== account) {
        account = window.web3.eth.accounts[0]
        // updateInterface()
      }
    }, 100)
    console.log('--------activated------------' + accountInterval)
  },
  deactivated () {
    console.log('--------deactivated------------')
  },
  mounted () {
    console.log('--------mounted------------')
  },
  destroyed () {
    console.log('--------destroyed------------')
  }
}
</script>



<style>
  .id_candidates
  {
    padding-bottom:60px;
    width: 90%;
    background-color: #ffffff;
    text-align: center;
    margin: 0 auto;
  }
  .vote_button
  {
    width: 80%;
    /*background-color: #0000ff;*/
    text-align: right
  }
  .country
  {
    width: 55%;
  }
  .country_name
  {
    width: 40%;
    float: left;
  }
  .country_flag
  {
    width: 40%;
    float: right;
    text-align: left;
  }
</style>