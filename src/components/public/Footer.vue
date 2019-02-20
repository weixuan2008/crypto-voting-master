<template>
  <div class="id_footer">
    <div class="copy">
      <p class="w3-link" v-html="footerText"></p>
    </div>
    <div class="clear"></div>
  </div>
</template>
<script>
export default {
  data () {
    return {
      footerText: 'Copyright &copy; 2019.HY Tech. All rights reserved.'
    }
  }
}
</script>

<style>
  .id_footer
  {
    position:absolute;
    bottom:0;width:100%;
    height:60px;
    background-color: #333333;
    text-align: center;
  }

  .copy p
  {
	  text-transform: capitalize;
	  font-size: 1.1725em;
	  color: #555555;
	  line-height: 1.8em;
  }
  
  .copy p a
  {
	  color: #000000;
  }

  .copy p a:hover
  {
	  color: #555555;
	  zoom: 1;
	  filter: alpha(opacity=50);
	  opacity: 0.7;
	  -webkit-transition: opacity .15s ease-in-out;
	  -moz-transition: opacity .15s ease-in-out;
	  -ms-transition: opacity .15s ease-in-out;
	  -o-transition: opacity .15s ease-in-out;
	  transition: opacity .15s ease-in-out;
  }
</style>