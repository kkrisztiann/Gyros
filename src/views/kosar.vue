<template>

<button class="btn btn-lg btn-dark m-3 rounded-circle kosargomb" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling"><i class="bi bi-cart3"></i></button>


<div class="offcanvas offcanvas-end" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
  <div class="offcanvas-header">
    <h5 class="offcanvas-title" id="offcanvasScrollingLabel"> Kosaram tartalma </h5>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
    
    <div class="d-flex flex-row justify-content-around"> <!-- ezt kell v-for -->
          <div v-for="etel in ">
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

.kosargomb{
  position: absolute;
  bottom: 0;
  right: 0;
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

},
methods:{
  Kosar(){
      if (JSON.parse(localStorage.getItem("kosar"))==null) {
      return [];
      }
      else{
        return JSON.parse(localStorage.getItem("kosar"));
      }
    }
}
}


</script>