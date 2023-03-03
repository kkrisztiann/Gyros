<template>
<div>
  <div v-for="etel in etelek" class="card" style="width: 20rem;">
    <img class="card-img-top" :src="etel.kep"  alt="Card image cap">
    <div class="card-body">
    <h5 class="card-title d-flex justify-content-center"> {{ etel.nev }} </h5>
    <p class="card-text osszetevok"> {{ etel.osszetevok }} </p>
    <p class="card-text"> {{ etel.ar }}  Ft</p>
    <div class="gombok d-flex justify-content-end">
      <input type="number"  min="1" max="10" v-model="etel.mennyiseg" style="width: 3vw; margin-right: 10px;" name="" id="">
      <a href="#" class="btn btn-dark" @click="KosarbaRak(etel)">Kosárba tesz</a>
    </div>
    </div>
  </div>
</div>


</template>

<script>
import axios from 'axios';

export default{
   components: {
     axios
   },
   data(){
      return{
         etelek: [],
         baseurl:"http://localhost/Fekete párducok/Gyros/API/database.php"
      }
   },
   created(){
    axios.get(this.baseurl+"?table=etelek").then(res => {
      this.etelek = res.data 
      this.etelek.forEach(element => {
        element.kep="../src/assets/img/"+element.kep
        element.mennyiseg=1
      });

    })
    .catch(err => {
      console.log(err);
    });
   },
   methods:{
    KosarbaRak(etel){
      
    }
   }
  }





</script>

<style scoped>
.card{
  border: 2px solid black !important;
  margin: 2%;
}

</style>