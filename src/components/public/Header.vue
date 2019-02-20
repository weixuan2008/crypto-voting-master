<template>
  <div class="id_header">
    <div class="logo">
      <img src="../../../static/images/logo.png" alt=""/>
    </div>
    
    <div class="cssmenu">
      <ul>
        <li>
          <router-link
            v-bind:class="{'active': this.$route.path === '/'}"
            tag="a"
            to="/"
          >Summary</router-link>
        </li>
        <li>
          <router-link
            v-bind:class="{'active': this.$route.path === '/vote'}"
            tag="a"
            to="/vote"
          >Vote</router-link>
        </li>
        <li>
          <router-link
            v-bind:class="{'active': this.$route.path === '/admin'}"
            tag="a"
            to="/admin"
          >Admin</router-link>
        </li>
        <div class="clear"></div>
      </ul>
    </div>
    <div class="clear"></div>
  </div>
</template>

<script>
export default {
  name: 'app-header',
  data () {
    return {
      headerText: 'This is the headerText'
    }
  },
  mounted () {
    console.log(this.$route.path)
  },
  methods: {
    created () {
      console.log(this.$route.path)
    }
  }
}
</script>


<style >
.id_header {
  background-color: #333333;
  height: 90px;
  width: 100%;
  margin-bottom: 30px;
  padding-left: 30px;
}

.logo{
  width: 30%;
  float:left;
}
/*menu*/
.cssmenu {
  width: 20%;
  float: right;
  text-align: left;
  height: 100%;
  vertical-align: middle;
  text-align: center;
}

.cssmenu > ul   {
	display:inline-block;
	position: relative;
  vertical-align: middle;
  padding-top: 20px;
  height: 100%;
}

.cssmenu > ul > li {
	display:inline-block;
	position: relative;
  vertical-align: middle;
}
.cssmenu > ul > li.active a{
	color:#ffffff;
}
.cssmenu > ul > li span img {
	vertical-align: middle;
}
.cssmenu > ul > li > a {
	font-family: 'Merriweather Sans', sans-serif;
	color: #999999;
	display: block;
	font-size: 16px;
	line-height: 1.5em;
	padding: 9px 18px;
	text-transform: uppercase;
	-webkit-transition: all 0.3s ease-out;
	-moz-transition: all 0.3s ease-out;
	-ms-transition: all 0.3s ease-out;
	-o-transition: all 0.3s ease-out;
	transition: all 0.3s ease-out;
}
.cssmenu > ul > li > a:hover {
	color: #ffffff;
}
</style>