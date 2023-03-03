<template>

<div class="tipp">
    <button class="btn btn-dark" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling"> Kosaram </button>
</div>

<div class="offcanvas offcanvas-end" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
  <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="offcanvasScrollingLabel"> Kosaram tartalma </h5>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    
    <div class="d-flex flex-row justify-content-around" v-for="kapcsolat in kapcsolatok"> <!-- ezt kell v-for -->
          <div v-for="etel in etelek">
            <span v-if="etel.ID = kapcsolat.etelekID">
              {{ etel.nev}}
            </span>
          </div>
          <div>
           Db
          </div>
          <div>
            Péz
          </div>
      </div>
     <div class="d-flex flex-row justify-content-around">
        <div>
            Őssz ár: 
        </div>
      <div>
          <div>
            <button class="btn btn-dark">
          Rendelés
      </button>
          </div>
      </div>
     </div>

  </div>
</div>
</template>
<style scoped>
.card{
    border: 2px solid black;
}
.offcanvas{
    background-color:lightgray;
    background-image: url('../assets/img/GörögAkhilleusz.png');
    background-repeat: repeat;
    background-size: contain;
    padding: 0 50px 0 50px;
}
.tipp {
    float: right;
  position: relative;
}
</style>
<script>
import axios from 'axios';

export default{
   components: {
     axios
   },
   data(){
     return{
       rendelesek: [],
       etelek: [],
       kapcsolatok: [],
       baseurl:"http://localhost/Gyros/API/database.php"
      }
    },
created(){

 axios.get(this.baseurl+"?table=rendelesek").then(res => {
   this.rendelesek = res.data 
 })
 .catch(err => {
   console.log(err);
 }),

  axios.get(this.baseurl+"?table=etelek").then(res => {
   this.etelek = res.data 
 })
 .catch(err => {
   console.log(err);
 }),

  axios.get(this.baseurl+"?table=kapcsolat").then(res => {
   this.kapcsolatok= res.data 
 })
 .catch(err => {
   console.log(err);
 })

}
}


</script>